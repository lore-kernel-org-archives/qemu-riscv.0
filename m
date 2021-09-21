Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mSaax-0007Ji-4E
	for mharc-qemu-riscv@gnu.org; Tue, 21 Sep 2021 03:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mSYKL-0000W7-Jh; Tue, 21 Sep 2021 01:28:21 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mSYKI-0006ED-76; Tue, 21 Sep 2021 01:28:21 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L4Y0C1010324; 
 Tue, 21 Sep 2021 05:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=I2v540fa7vp/Dg5O1mH6njJD6KNJn6piGJDQmSXBYoY=;
 b=SHmQk2+EsY/JSihRWdVtci+Vr9C7qfu+QRbYDmna6p/WUBMTiYSdd32C5046/Wf24Qy/
 OFgYnueTulDHH+yTzJVjdHc+XJKI4Ucpud5ZKhSDWCbOW+puUD6vhy+u3loOCLeDha7U
 XKNPOm5mNK1ckojIGuutOmVYmDvLXASxdWS2LiWALynPuEmS5G0WU/3YmWcailt1L0M4
 EdSPHnlmrgA6hAKzrbwERNV6GzMlxWrru6/LQiukCz1yZsPNM3I6oaDtpdLy3+xAwNKq
 NElSMQOYTkZ2JnFYdEsG5js58okTlgGvTuQVPMYPwM3H26HQ6yDMQ9ZzUlEkSzgEb6An mg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b78fwg48x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Sep 2021 05:27:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18L5KlBD013620;
 Tue, 21 Sep 2021 05:27:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by aserp3020.oracle.com with ESMTP id 3b57x4yxgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Sep 2021 05:27:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGQ7SLP2KremCM9KK3nJtaH24auTcCeFH6Jve7cIXH0k70m6nTSUtpkq4dvXtEMMYVEtRYVRXRYFIkbAnANdcv8rujcYtW85lu79iFEK0SkGoxZ0PFKV07lSlwgYQgaAap+T1Q/vUu8g1drIagQHrt+5FN6ylmzlTCg8cSLwlL7TrKf9JffqTxVlvBawABmS1lAD1AWRHz1ut7cws/suWCsXamRfgXLyRyRFErZP1hOmSeSBvJ0RFXYnrI+2X2opmw0ql9XNTszrq9g53nEi7ePgeBOBZEzssUS06NPa2tZ8zU7SrBwaU7CHMKcm/MoiRJh1xT9DWvzQX2uQcRGYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=I2v540fa7vp/Dg5O1mH6njJD6KNJn6piGJDQmSXBYoY=;
 b=hV7kyZSjixN4Ae2jOSovjJRB0xIl49WhMYjhsLPyfM3NCJskwqjtBVL9STNR505oVnhNd+vqXZV5qrvZ5Tvic+LNrpqmw69Ib0Y+DGRS/366pli9bG2h2aeeAyD6gHmxLDE/rMGSHBtiS7897F92hLn/PeXXSVzwyenblVunwBrvS2QwyFNiBiOr2aEE3rsJwAhjgVs5rgKctxio/PCwjF+hST07uScXSmVKxVs048CQjn4WpXcIUyassFX/d3kLD4K8VAHXt0r/yragXQDTpwQR5UTHK7BuzdrYpj5hGudD8CU2uWc0gcun9xrnhbBx/dtbFrAAcuoLEM2ic1Yibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2v540fa7vp/Dg5O1mH6njJD6KNJn6piGJDQmSXBYoY=;
 b=hVhkZ0ZaH+VwIh7+L7SNT5/G2DtFKtvunY+VkLncdLbawReOieQQTbj7mwbVOYjEoNUG1owebtGcph82qPT1rnhFyNvtWjLwARZxNmR27ZgH70qhVvy1QThWGTZsi7z2WNFSGBd2YQl49lZLf9dqxaSxXaVnrJvIZQYPM9kSROI=
Authentication-Results: aurel32.net; dkim=none (message not signed)
 header.d=none;aurel32.net; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB4115.namprd10.prod.outlook.com (2603:10b6:a03:213::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 21 Sep
 2021 05:27:13 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::39ae:71d3:1f4d:b4d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::39ae:71d3:1f4d:b4d%4]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 05:27:13 +0000
Subject: Re: [PATCH v2 38/53] qapi: introduce x-query-lapic QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-39-berrange@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <68cebe2f-ba56-545f-686a-b9ac2120c5c4@oracle.com>
Date: Mon, 20 Sep 2021 22:27:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210914142042.1655100-39-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:806:28::31) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
Received: from [IPv6:2606:b400:400:7444:8000::957] (2606:b400:8301:1010::16aa)
 by SA9PR13CA0176.namprd13.prod.outlook.com (2603:10b6:806:28::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend
 Transport; Tue, 21 Sep 2021 05:27:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 546e3d98-ea4d-4841-bc61-08d97cc0775a
X-MS-TrafficTypeDiagnostic: BY5PR10MB4115:
X-Microsoft-Antispam-PRVS: <BY5PR10MB41157F2368563748ABAD30FAF0A19@BY5PR10MB4115.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecfllEL1PJ9vtHH2sEtzJPR7QzBKEew0BMgwn9eJrHmMgcrNezBM4HnkXgl37Oi83gxFF/SYDFV4bHW7JZrUjOg9xek48MQumfIVCaHoeOiAN9FY8lxfc7dtsLJdo9HODhgsOdFOTRUdgXVPvTIdjbyEURyvG3bLZeTFUM/lWklaLm3eRAwsAXp21lB7tDDlhDNjO1XewQ6kJcAy7eGtvsDsNNeJTmJ5iYmCEeToi7g3W3t5S99fkwWAjvLJRVQpobZmsib8I0pejg8yXudkEVCh5gOrZIGNORikGkBBTQ9pPIIB+V4AbfiA56wTZ8rjSy/+5RIF8itOwOHFJQuAy0vqwgyQHwavA/PEai5lxVSUZNefJlLtRo0xjgw3U4jOEn601qOlug+F5QAKnn2OaBmYt4cXXKRBZN/EpRrnHndDlAokx3zmGejEqm+RCC7bhWRPqxTnr2w8Imc+3mFdsEgTya1bGMFcHm/JOm8lBAiBLYQCtX8dStA8SUCH4SLrYPkxgxzO084mXBjb8AW90L1Q6dTTRvSU4vzUAkgWpoyuBQ7mVZ03vomeGXAs7faoCZh82zGxjLu//C38uj+xcFcApOIVVZepHTDm0YvhHRd1H1fGrJBzu6wDbCbJteij8irJMCQaee3HApUEEdSoa5x5KSD/VFBLmjdQAJma6H21qlVYzk9hS3opDfTNLjCfK/rMArtvrCSQtk2bmNyUXSeXE7Mpbj+MmdZNN7bvhh3TME73suuR6zOk0S3nQsVH+imchoLZxeZI3qAcueObABAJ8fnfyoDvIZT+hYxA9FnvEf+leRc+cSVYKfdwIZQ6I4g30gSOLl181WJ1X31K/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(2906002)(31696002)(4326008)(66946007)(316002)(66476007)(966005)(38100700002)(8936002)(7416002)(7406005)(5660300002)(66556008)(53546011)(83380400001)(36756003)(44832011)(30864003)(54906003)(31686004)(186003)(2616005)(6486002)(508600001)(8676002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0YrVEdTYTJmc1lOanJNcTI5SnR6MFZselV4Z1l1TnMxZUd2M2RqRzBpMCsx?=
 =?utf-8?B?RnA2cVlxY0xBVnpvb1ZCc2FZRWFZNDVqUlpjOHZPMnVrbWtobFFQbWVFRFpx?=
 =?utf-8?B?VlNaVExONkt4c3J4Vk0rZEEyK3I5ZU1PbzJRRjZQSHYvV3FzMmc3dW5LbHBX?=
 =?utf-8?B?Ni9BTHNVSHVZTFZCZWducFp0R2ErNGNBQUE0SWExSnlwZ1U5Smlwc3dnV1la?=
 =?utf-8?B?VEdPZUE2U1p1blZDMyttWUZlS24vOFFERXhzU1pOUUh6UEVjY3VLV1djTllw?=
 =?utf-8?B?UGJheFp4R3J4dklyMFR2emJ4dWRsdG5KY0lIaVh6SXBIMU5CNU02cGhTaER5?=
 =?utf-8?B?VFp1ME1VdEZGam9WNlphN2dSbCtrUTdoZkZTdURBdmRFTGQ3RXlMV0I2dlVv?=
 =?utf-8?B?VG9TeUlBRjhmVjJYa2ZXc3IvQjRQSVFRTXVxMjQ2WTFRRUdaU2NIeERvOVdB?=
 =?utf-8?B?S0pHY3U1MlNza0JKY3FVSkczT0lIL09tQzVmYWNsYzhTQ3hWc0l0aDcvY0ww?=
 =?utf-8?B?QmtmQ0JUTWhESEJCRWFLN2FLM3pOcTJlcE42MldpT21FTUV6TEdNOCtXelZT?=
 =?utf-8?B?TEtOZzh2dEFkUDVxZ3RvcEhoY0VZcnZqdEMxL3RUSkVpSFdRSkQ1V3RBZy9Z?=
 =?utf-8?B?cElibEdqM1pYTk1aQjF5NXl3VXRnVEFoUTc0WWdVYk9HdjgraEllbnB0cHMz?=
 =?utf-8?B?RzJVWlFWOXhPakwyUnFKQ2o3dmxubUkrRUdTbEZTT2pmVVZNZndWcG1QcGNM?=
 =?utf-8?B?bitDZ0JGV25UQkJOWVk1cHM5aTBjSEJnNDdCQmdxaEN5VW5zWGNwZW5kUXNp?=
 =?utf-8?B?eVZpdVI1N3VyMU1NVGRpdnlQTlc0bkwycmVtVXIvdmFtYTB3MmtqSGVzWTIw?=
 =?utf-8?B?TXptM3NhMlhlRkpSNmZNamd4bW5GRHIrSkRCVUJDL3FJZXZWcEI2dElIdXdu?=
 =?utf-8?B?R25paTNBeHN6QjJIM2xHQThIT2tiM3J2V2ViS1NhdjljSkkrOTBWMFI2T2cw?=
 =?utf-8?B?V3RjR1kwVWh2bnB6ZDJIZ09iOHhNUjVvRnVNNFduVXFKTjB0eFRLSDgzck1I?=
 =?utf-8?B?UWlTelNuTE4vOGY3a3F0WFlWK2VtNU5saW1CTSswVklIdkdxZ0dlYWdRRFVa?=
 =?utf-8?B?SHNNelR1Vmt3YWd1dGFDVXRUMUZoeXJIRnpZLy82dDZ3U3UvT0xSZkJQb2NT?=
 =?utf-8?B?S1JVQUhFY1VnMzR1N2xPRmdQWTRqaTdYV0hYTWxITnZLMFZndStDY0c5YldF?=
 =?utf-8?B?ZGVISlRUa1NEcURkQUJjQmQyc3lmcnVEcmlSeUd6RmppN29YWUQ3OFpCTE5R?=
 =?utf-8?B?ZG9mYjZGWHJqa1F6NnowOGsySU10VDdXK0tTVjFrOGEvQlZFV1Z6Z2E4bHM3?=
 =?utf-8?B?eHQ3T0xKWGxBZHpRVUZyL2hBaVJjYndiQzZMeXRiRFpKbnVpV3Z4eklGeDZK?=
 =?utf-8?B?OVpwRVJ6RmdTNmdrSXlOV0dybVJnamhZVWpXT3dmOVN6eWloRWx1WUQwMnM1?=
 =?utf-8?B?ZHVsd2V3c3Jpd2U1RTh5cHArNjU3UytqZ2RKSlpKblJsRjJZaUFPYlExWEw2?=
 =?utf-8?B?QmZTb0E5Y2ttMmRSbXFwSEJrL2FvdkdlZ2pOQUxmbEp0Z0FNZ01GaVhrL1dk?=
 =?utf-8?B?UDNzOEw1NzNvRmIwQ1E3TkI3Tk8yN2FYMkhybGNSdWVIZ2lpWGF4TjVkZWox?=
 =?utf-8?B?MjY4WWh2ejBQZEcwWDZSUTVGcGRwaEJwRzcyMTBhM2pKeC9jY1llRnJSZVB1?=
 =?utf-8?B?V2VUVnpJNkhnTEs5WW1tRlJIUTFzSGxyOFQzME5FcThFWGZudkMwaEVnaDZS?=
 =?utf-8?B?YVFRNFBubXA1ek1uemplUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546e3d98-ea4d-4841-bc61-08d97cc0775a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 05:27:12.9724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1WoIwVeSfjFaKpPiVI/vRgRZrsrFxDCMN/g9+v1Is0iQmxwyCSi8Nv6lQYBLsmhs0Ake1C73lI4IuLmBgNWvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4115
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10113
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109210033
X-Proofpoint-GUID: ZGT2ntnIj6qxcq085KpGDZlZoZ9kXhcj
X-Proofpoint-ORIG-GUID: ZGT2ntnIj6qxcq085KpGDZlZoZ9kXhcj
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Sep 2021 03:53:35 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Sep 2021 05:28:22 -0000

Hi Daniel,

On 9/14/21 7:20 AM, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info lapic" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> This command is unable to use the pre-existing HumanReadableText,
> because if 'common.json' is included into 'machine-target.json'
> the static marshalling method for HumanReadableText will be reported
> as unused by the compiler on all architectures except s390x.
> 
> Possible options were
> 
>  1 Support 'if' conditionals on 'include' statements in QAPI
>  2 Add further commands to 'machine-target.json' that use
>    HumanReadableText, such that it has at least one usage
>    on all architecture targets.
>  3 Duplicate HumanReadableText as TargetHumanReadableText
>    adding conditions
> 
> This patch takes option (3) in the belief that we will eventually
> get to a point where option (2) happens, and TargetHumanReadableText
> can be removed again.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/core/cpu-common.c     |   7 ++
>  include/hw/core/cpu.h    |  10 +++
>  qapi/machine-target.json |  19 ++++-
>  target/i386/cpu-dump.c   | 161 ++++++++++++++++++++-------------------
>  target/i386/cpu.h        |   4 +-
>  target/i386/monitor.c    |  46 +++++++++--
>  6 files changed, 160 insertions(+), 87 deletions(-)
> 
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index c2cd33a817..d1ebc77d1b 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -49,6 +49,13 @@ CPUState *cpu_by_arch_id(int64_t id)
>      return NULL;
>  }
>  
> +int64_t cpu_get_arch_id(CPUState *cpu)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    return cc->get_arch_id(cpu);
> +}
> +
>  bool cpu_exists(int64_t id)
>  {
>      return !!cpu_by_arch_id(id);
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 1599ef9df3..a0913eedaa 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -780,6 +780,16 @@ bool cpu_exists(int64_t id);
>   */
>  CPUState *cpu_by_arch_id(int64_t id);
>  
> +/**
> + * cpu_get_arch_id:
> + * @cpu: the CPU to query
> + *
> + * Get the guest exposed CPU ID for @cpu
> + *
> + * Returns: The guest exposed CPU ID
> + */
> +int64_t cpu_get_arch_id(CPUState *cpu);
> +
>  /**
>   * cpu_interrupt:
>   * @cpu: The CPU to set an interrupt on.
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 9040aff863..62220d1f08 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -353,7 +353,8 @@
>  ##
>  { 'struct': 'TargetHumanReadableText',
>    'data': { 'human-readable-text': 'str' },
> -  'if': 'TARGET_S390X' }
> +  'if': { 'any': ['TARGET_S390X',
> +                  'TARGET_I386' ] } }
>  
>  ##
>  # @x-query-cmma:
> @@ -369,6 +370,22 @@
>    'returns': 'TargetHumanReadableText',
>    'if': 'TARGET_S390X' }
>  
> +##
> +# @x-query-lapic:
> +#
> +# @apic-id: the local APIC ID to report
> +#
> +# Query local APIC state.
> +#
> +# Returns: local APIC state
> +#
> +# Since: 6.2
> +##
> +{ 'command': 'x-query-lapic',
> +  'data': { 'apic-id': 'int' },
> +  'returns': 'TargetHumanReadableText',
> +  'if': 'TARGET_I386' }
> +
>  ##
>  # @x-query-skeys:
>  #
> diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
> index f30fbcb76e..41a1f64138 100644
> --- a/target/i386/cpu-dump.c
> +++ b/target/i386/cpu-dump.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "qemu/qemu-print.h"
> +#include "qapi/error.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "hw/i386/apic_internal.h"
>  #endif
> @@ -179,24 +180,26 @@ static inline const char *dm2str(uint32_t dm)
>      return str[dm];
>  }
>  
> -static void dump_apic_lvt(const char *name, uint32_t lvt, bool is_timer)
> +static void format_apic_lvt(const char *name, uint32_t lvt, bool is_timer,
> +                            GString *buf)
>  {
>      uint32_t dm = (lvt & APIC_LVT_DELIV_MOD) >> APIC_LVT_DELIV_MOD_SHIFT;
> -    qemu_printf("%s\t 0x%08x %s %-5s %-6s %-7s %-12s %-6s",
> -                name, lvt,
> -                lvt & APIC_LVT_INT_POLARITY ? "active-lo" : "active-hi",
> -                lvt & APIC_LVT_LEVEL_TRIGGER ? "level" : "edge",
> -                lvt & APIC_LVT_MASKED ? "masked" : "",
> -                lvt & APIC_LVT_DELIV_STS ? "pending" : "",
> -                !is_timer ?
> -                    "" : lvt & APIC_LVT_TIMER_PERIODIC ?
> -                            "periodic" : lvt & APIC_LVT_TIMER_TSCDEADLINE ?
> -                                            "tsc-deadline" : "one-shot",
> +    g_string_append_printf(buf, "%s\t 0x%08x %s %-5s %-6s %-7s %-12s %-6s",
> +                           name, lvt,
> +                           lvt & APIC_LVT_INT_POLARITY ?
> +                           "active-lo" : "active-hi",
> +                           lvt & APIC_LVT_LEVEL_TRIGGER ? "level" : "edge",
> +                           lvt & APIC_LVT_MASKED ? "masked" : "",
> +                           lvt & APIC_LVT_DELIV_STS ? "pending" : "",
> +                           !is_timer ?
> +                           "" : lvt & APIC_LVT_TIMER_PERIODIC ?
> +                           "periodic" : lvt & APIC_LVT_TIMER_TSCDEADLINE ?
> +                           "tsc-deadline" : "one-shot",
>                  dm2str(dm));
>      if (dm != APIC_DM_NMI) {
> -        qemu_printf(" (vec %u)\n", lvt & APIC_VECTOR_MASK);
> +        g_string_append_printf(buf, " (vec %u)\n", lvt & APIC_VECTOR_MASK);
>      } else {
> -        qemu_printf("\n");
> +        g_string_append_printf(buf, "\n");
>      }
>  }
>  
> @@ -228,7 +231,7 @@ static inline void mask2str(char *str, uint32_t val, uint8_t size)
>  
>  #define MAX_LOGICAL_APIC_ID_MASK_SIZE 16
>  
> -static void dump_apic_icr(APICCommonState *s, CPUX86State *env)
> +static void format_apic_icr(APICCommonState *s, CPUX86State *env, GString *buf)
>  {
>      uint32_t icr = s->icr[0], icr2 = s->icr[1];
>      uint8_t dest_shorthand = \
> @@ -238,16 +241,16 @@ static void dump_apic_icr(APICCommonState *s, CPUX86State *env)
>      uint32_t dest_field;
>      bool x2apic;
>  
> -    qemu_printf("ICR\t 0x%08x %s %s %s %s\n",
> -                icr,
> -                logical_mod ? "logical" : "physical",
> -                icr & APIC_ICR_TRIGGER_MOD ? "level" : "edge",
> -                icr & APIC_ICR_LEVEL ? "assert" : "de-assert",
> -                shorthand2str(dest_shorthand));
> +    g_string_append_printf(buf, "ICR\t 0x%08x %s %s %s %s\n",
> +                           icr,
> +                           logical_mod ? "logical" : "physical",
> +                           icr & APIC_ICR_TRIGGER_MOD ? "level" : "edge",
> +                           icr & APIC_ICR_LEVEL ? "assert" : "de-assert",
> +                           shorthand2str(dest_shorthand));
>  
> -    qemu_printf("ICR2\t 0x%08x", icr2);
> +    g_string_append_printf(buf, "ICR2\t 0x%08x", icr2);
>      if (dest_shorthand != 0) {
> -        qemu_printf("\n");
> +        g_string_append_printf(buf, "\n");
>          return;
>      }
>      x2apic = env->features[FEAT_1_ECX] & CPUID_EXT_X2APIC;
> @@ -255,96 +258,100 @@ static void dump_apic_icr(APICCommonState *s, CPUX86State *env)
>  
>      if (!logical_mod) {
>          if (x2apic) {
> -            qemu_printf(" cpu %u (X2APIC ID)\n", dest_field);
> +            g_string_append_printf(buf, " cpu %u (X2APIC ID)\n", dest_field);
>          } else {
> -            qemu_printf(" cpu %u (APIC ID)\n",
> -                        dest_field & APIC_LOGDEST_XAPIC_ID);
> +            g_string_append_printf(buf, " cpu %u (APIC ID)\n",
> +                                   dest_field & APIC_LOGDEST_XAPIC_ID);
>          }
>          return;
>      }
>  
>      if (s->dest_mode == 0xf) { /* flat mode */
>          mask2str(apic_id_str, icr2 >> APIC_ICR_DEST_SHIFT, 8);
> -        qemu_printf(" mask %s (APIC ID)\n", apic_id_str);
> +        g_string_append_printf(buf, " mask %s (APIC ID)\n", apic_id_str);
>      } else if (s->dest_mode == 0) { /* cluster mode */
>          if (x2apic) {
>              mask2str(apic_id_str, dest_field & APIC_LOGDEST_X2APIC_ID, 16);
> -            qemu_printf(" cluster %u mask %s (X2APIC ID)\n",
> -                        dest_field >> APIC_LOGDEST_X2APIC_SHIFT, apic_id_str);
> +            g_string_append_printf(buf, " cluster %u mask %s (X2APIC ID)\n",
> +                                   dest_field >> APIC_LOGDEST_X2APIC_SHIFT,
> +                                   apic_id_str);
>          } else {
>              mask2str(apic_id_str, dest_field & APIC_LOGDEST_XAPIC_ID, 4);
> -            qemu_printf(" cluster %u mask %s (APIC ID)\n",
> -                        dest_field >> APIC_LOGDEST_XAPIC_SHIFT, apic_id_str);
> +            g_string_append_printf(buf, " cluster %u mask %s (APIC ID)\n",
> +                                   dest_field >> APIC_LOGDEST_XAPIC_SHIFT,
> +                                   apic_id_str);
>          }
>      }
>  }
>  
> -static void dump_apic_interrupt(const char *name, uint32_t *ireg_tab,
> -                                uint32_t *tmr_tab)
> +static void format_apic_interrupt(const char *name, uint32_t *ireg_tab,
> +                                  uint32_t *tmr_tab, GString *buf)
>  {
>      int i, empty = true;
>  
> -    qemu_printf("%s\t ", name);
> +    g_string_append_printf(buf, "%s\t ", name);
>      for (i = 0; i < 256; i++) {
>          if (apic_get_bit(ireg_tab, i)) {
> -            qemu_printf("%u%s ", i,
> -                        apic_get_bit(tmr_tab, i) ? "(level)" : "");
> +            g_string_append_printf(buf, "%u%s ", i,
> +                                   apic_get_bit(tmr_tab, i) ? "(level)" : "");
>              empty = false;
>          }
>      }
> -    qemu_printf("%s\n", empty ? "(none)" : "");
> +    g_string_append_printf(buf, "%s\n", empty ? "(none)" : "");
>  }
>  
> -void x86_cpu_dump_local_apic_state(CPUState *cs, int flags)
> +GString *x86_cpu_format_local_apic_state(CPUState *cs, int flags, Error **errp)
>  {
> +    g_autoptr(GString) buf = g_string_new("");
>      X86CPU *cpu = X86_CPU(cs);
>      APICCommonState *s = APIC_COMMON(cpu->apic_state);
>      if (!s) {
> -        qemu_printf("local apic state not available\n");
> -        return;
> +        error_setg(errp, "local apic state not available");
> +        return NULL;
>      }
>      uint32_t *lvt = s->lvt;
>  
> -    qemu_printf("dumping local APIC state for CPU %-2u\n\n",
> -                CPU(cpu)->cpu_index);
> -    dump_apic_lvt("LVT0", lvt[APIC_LVT_LINT0], false);
> -    dump_apic_lvt("LVT1", lvt[APIC_LVT_LINT1], false);
> -    dump_apic_lvt("LVTPC", lvt[APIC_LVT_PERFORM], false);
> -    dump_apic_lvt("LVTERR", lvt[APIC_LVT_ERROR], false);
> -    dump_apic_lvt("LVTTHMR", lvt[APIC_LVT_THERMAL], false);
> -    dump_apic_lvt("LVTT", lvt[APIC_LVT_TIMER], true);
> -
> -    qemu_printf("Timer\t DCR=0x%x (divide by %u) initial_count = %u"
> -                " current_count = %u\n",
> -                s->divide_conf & APIC_DCR_MASK,
> -                divider_conf(s->divide_conf),
> -                s->initial_count, apic_get_current_count(s));
> -
> -    qemu_printf("SPIV\t 0x%08x APIC %s, focus=%s, spurious vec %u\n",
> -                s->spurious_vec,
> -                s->spurious_vec & APIC_SPURIO_ENABLED ? "enabled" : "disabled",
> -                s->spurious_vec & APIC_SPURIO_FOCUS ? "on" : "off",
> -                s->spurious_vec & APIC_VECTOR_MASK);
> -
> -    dump_apic_icr(s, &cpu->env);
> -
> -    qemu_printf("ESR\t 0x%08x\n", s->esr);
> -
> -    dump_apic_interrupt("ISR", s->isr, s->tmr);
> -    dump_apic_interrupt("IRR", s->irr, s->tmr);
> -
> -    qemu_printf("\nAPR 0x%02x TPR 0x%02x DFR 0x%02x LDR 0x%02x",
> -                s->arb_id, s->tpr, s->dest_mode, s->log_dest);
> +    g_string_append_printf(buf, "dumping local APIC state for CPU %-2u\n\n",
> +                           CPU(cpu)->cpu_index);
> +    format_apic_lvt("LVT0", lvt[APIC_LVT_LINT0], false, buf);
> +    format_apic_lvt("LVT1", lvt[APIC_LVT_LINT1], false, buf);
> +    format_apic_lvt("LVTPC", lvt[APIC_LVT_PERFORM], false, buf);
> +    format_apic_lvt("LVTERR", lvt[APIC_LVT_ERROR], false, buf);
> +    format_apic_lvt("LVTTHMR", lvt[APIC_LVT_THERMAL], false, buf);
> +    format_apic_lvt("LVTT", lvt[APIC_LVT_TIMER], true, buf);
> +
> +    g_string_append_printf(buf,
> +                           "Timer\t DCR=0x%x (divide by %u) initial_count = %u"
> +                           " current_count = %u\n",
> +                           s->divide_conf & APIC_DCR_MASK,
> +                           divider_conf(s->divide_conf),
> +                           s->initial_count, apic_get_current_count(s));
> +
> +    g_string_append_printf(buf,
> +                           "SPIV\t 0x%08x APIC %s, focus=%s, spurious vec %u\n",
> +                           s->spurious_vec,
> +                           s->spurious_vec & APIC_SPURIO_ENABLED ?
> +                           "enabled" : "disabled",
> +                           s->spurious_vec & APIC_SPURIO_FOCUS ? "on" : "off",
> +                           s->spurious_vec & APIC_VECTOR_MASK);
> +
> +    format_apic_icr(s, &cpu->env, buf);
> +
> +    g_string_append_printf(buf, "ESR\t 0x%08x\n", s->esr);
> +
> +    format_apic_interrupt("ISR", s->isr, s->tmr, buf);
> +    format_apic_interrupt("IRR", s->irr, s->tmr, buf);
> +
> +    g_string_append_printf(buf, "\nAPR 0x%02x TPR 0x%02x DFR 0x%02x LDR 0x%02x",
> +                           s->arb_id, s->tpr, s->dest_mode, s->log_dest);
>      if (s->dest_mode == 0) {
> -        qemu_printf("(cluster %u: id %u)",
> -                    s->log_dest >> APIC_LOGDEST_XAPIC_SHIFT,
> -                    s->log_dest & APIC_LOGDEST_XAPIC_ID);
> +        g_string_append_printf(buf, "(cluster %u: id %u)",
> +                               s->log_dest >> APIC_LOGDEST_XAPIC_SHIFT,
> +                               s->log_dest & APIC_LOGDEST_XAPIC_ID);
>      }
> -    qemu_printf(" PPR 0x%02x\n", apic_get_ppr(s));
> -}
> -#else
> -void x86_cpu_dump_local_apic_state(CPUState *cs, int flags)
> -{
> +    g_string_append_printf(buf, " PPR 0x%02x\n", apic_get_ppr(s));
> +
> +    return g_steal_pointer(&buf);
>  }
>  #endif /* !CONFIG_USER_ONLY */
>  
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d87c8808f6..2bcb175da8 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2201,8 +2201,10 @@ void x86_cpu_set_default_version(X86CPUVersion version);
>  #define APIC_DEFAULT_ADDRESS 0xfee00000
>  #define APIC_SPACE_SIZE      0x100000
>  
> +#ifndef CONFIG_USER_ONLY
>  /* cpu-dump.c */
> -void x86_cpu_dump_local_apic_state(CPUState *cs, int flags);
> +GString *x86_cpu_format_local_apic_state(CPUState *cs, int flags, Error **errp);
> +#endif /* !CONFIG_USER_ONLY */
>  
>  /* cpu.c */
>  bool cpu_is_bsp(X86CPU *cpu);
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 19468c4e85..fc09f90059 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -33,6 +33,7 @@
>  #include "qapi/error.h"
>  #include "sev_i386.h"
>  #include "qapi/qapi-commands-misc-target.h"
> +#include "qapi/qapi-commands-machine-target.h"
>  #include "qapi/qapi-commands-misc.h"
>  #include "hw/i386/pc.h"
>  
> @@ -650,23 +651,52 @@ const MonitorDef *target_monitor_defs(void)
>      return monitor_defs;
>  }
>  
> +TargetHumanReadableText *qmp_x_query_lapic(int64_t apicid,
> +                                           Error **errp)
> +{
> +    TargetHumanReadableText *ret;
> +    g_autoptr(GString) buf = NULL;
> +    CPUState *cs = cpu_by_arch_id(apicid);
> +
> +    if (!cs) {
> +        error_setg(errp, "No CPU with APIC ID %" PRId64 " available", apicid);
> +        return NULL;
> +    }

Suppose the accelerator is KVM, the CPUState (cs) might not be syncrhonized with
KVM kernel space (APIC+PIR). As a result, the data is stale.

I sent below patch long time ago but it never got reviewed.

https://lore.kernel.org/qemu-devel/20210908143803.29191-1-dongli.zhang@oracle.com/

> +
> +    buf = x86_cpu_format_local_apic_state(cs, CPU_DUMP_FPU, errp);
> +    if (!buf) {
> +        return NULL;
> +    }
> +
> +    ret = g_new0(TargetHumanReadableText, 1);
> +    ret->human_readable_text = g_steal_pointer(&buf->str);
> +    return ret;
> +}
> +
>  void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
>  {
> -    CPUState *cs;
> +    Error *err = NULL;
> +    g_autoptr(TargetHumanReadableText) info = NULL;
> +    int64_t apicid;
>  
>      if (qdict_haskey(qdict, "apic-id")) {
> -        int id = qdict_get_try_int(qdict, "apic-id", 0);
> -        cs = cpu_by_arch_id(id);
> +        apicid = qdict_get_try_int(qdict, "apic-id", 0);

Here is where I used to fix with the patch.

Thank you very much!

Dongli Zhang

>      } else {
> -        cs = mon_get_cpu(mon);
> +        CPUState *cs = mon_get_cpu(mon);
> +        if (!cs) {
> +            monitor_printf(mon, "No CPU available\n");
> +            return;
> +        }
> +        apicid = cpu_get_arch_id(cs);
>      }
>  
> -
> -    if (!cs) {
> -        monitor_printf(mon, "No CPU available\n");
> +    info = qmp_x_query_lapic(apicid, &err);
> +    if (err) {
> +        error_report_err(err);
>          return;
>      }
> -    x86_cpu_dump_local_apic_state(cs, CPU_DUMP_FPU);
> +
> +    monitor_printf(mon, "%s", info->human_readable_text);
>  }
>  
>  SevInfo *qmp_query_sev(Error **errp)
> 

