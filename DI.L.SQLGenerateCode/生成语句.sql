

-- 查询所有的数据库
SELECT Name FROM Master..SysDatabases ORDER BY Name

-- 查询所有的表
SELECT Name FROM SysObjects Where XType='U' ORDER BY Name


--查询表结构
SELECT (case when a.colorder=1 then d.name else null end) 表名,  
a.colorder 字段序号,a.name 字段名,
(case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '√'else '' end) 标识, 
(case when (SELECT count(*) FROM sysobjects  
WHERE (name in (SELECT name FROM sysindexes  
WHERE (id = a.id) AND (indid in  
(SELECT indid FROM sysindexkeys  
WHERE (id = a.id) AND (colid in  
(SELECT colid FROM syscolumns WHERE (id = a.id) AND (name = a.name)))))))  
AND (xtype = 'PK'))>0 then '√' else '' end) 主键,b.name 类型,a.length 占用字节数,  
COLUMNPROPERTY(a.id,a.name,'PRECISION') as 长度,  
isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0) as 小数位数,(case when a.isnullable=1 then '√'else '' end) 允许空,  
isnull(e.text,'') 默认值,isnull(g.[value], ' ') AS [说明]
FROM  syscolumns a 
left join systypes b on a.xtype=b.xusertype  
inner join sysobjects d on a.id=d.id and d.xtype='U' and d.name<>'dtproperties' 
left join syscomments e on a.cdefault=e.id  
left join sys.extended_properties g on a.id=g.major_id AND a.colid=g.minor_id
left join sys.extended_properties f on d.id=f.class and f.minor_id=0
where b.name is not null
and  d.name='AspNetRoles' --如果只查询指定表,加上此条件
order by a.id,a.colorder









--查询表结构
SELECT 
a.name FieldName,

(case when (SELECT count(*) FROM sysobjects  
WHERE (name in (SELECT name FROM sysindexes  
WHERE (id = a.id) AND (indid in  
(SELECT indid FROM sysindexkeys  
WHERE (id = a.id) AND (colid in  
(SELECT colid FROM syscolumns WHERE (id = a.id) AND (name = a.name)))))))  
AND (xtype = 'PK'))>0 then 1 else 0 end) IsPrimaryKey,
(case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then 1 else 0 end) IsIdentity, 

b.name FieldType,
a.length OccupancyBytes,  
COLUMNPROPERTY(a.id,a.name,'PRECISION') as FieldLength,  
isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0) as DecimalDigits,
(case when a.isnullable=1 then 1 else 0 end) CanNull
FROM  syscolumns a 
left join systypes b on a.xtype=b.xusertype  
inner join sysobjects d on a.id=d.id and d.xtype='U' and d.name<>'dtproperties' 
left join syscomments e on a.cdefault=e.id  
left join sys.extended_properties g on a.id=g.major_id AND a.colid=g.minor_id
left join sys.extended_properties f on d.id=f.class and f.minor_id=0
where b.name is not null
and  d.name='AspNetUserClaims' --如果只查询指定表,加上此条件
order by a.id,a.colorder

