

-- ��ѯ���е����ݿ�
SELECT Name FROM Master..SysDatabases ORDER BY Name

-- ��ѯ���еı�
SELECT Name FROM SysObjects Where XType='U' ORDER BY Name


--��ѯ��ṹ
SELECT (case when a.colorder=1 then d.name else null end) ����,  
a.colorder �ֶ����,a.name �ֶ���,
(case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '��'else '' end) ��ʶ, 
(case when (SELECT count(*) FROM sysobjects  
WHERE (name in (SELECT name FROM sysindexes  
WHERE (id = a.id) AND (indid in  
(SELECT indid FROM sysindexkeys  
WHERE (id = a.id) AND (colid in  
(SELECT colid FROM syscolumns WHERE (id = a.id) AND (name = a.name)))))))  
AND (xtype = 'PK'))>0 then '��' else '' end) ����,b.name ����,a.length ռ���ֽ���,  
COLUMNPROPERTY(a.id,a.name,'PRECISION') as ����,  
isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0) as С��λ��,(case when a.isnullable=1 then '��'else '' end) �����,  
isnull(e.text,'') Ĭ��ֵ,isnull(g.[value], ' ') AS [˵��]
FROM  syscolumns a 
left join systypes b on a.xtype=b.xusertype  
inner join sysobjects d on a.id=d.id and d.xtype='U' and d.name<>'dtproperties' 
left join syscomments e on a.cdefault=e.id  
left join sys.extended_properties g on a.id=g.major_id AND a.colid=g.minor_id
left join sys.extended_properties f on d.id=f.class and f.minor_id=0
where b.name is not null
and  d.name='AspNetRoles' --���ֻ��ѯָ����,���ϴ�����
order by a.id,a.colorder









--��ѯ��ṹ
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
and  d.name='AspNetUserClaims' --���ֻ��ѯָ����,���ϴ�����
order by a.id,a.colorder

