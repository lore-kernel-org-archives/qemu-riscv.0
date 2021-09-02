Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrB-000113-3s
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkqz-0000vr-Og; Thu, 02 Sep 2021 07:25:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkqv-0002oS-Da; Thu, 02 Sep 2021 07:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581953; x=1662117953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QREUaSUzuNLHnhLRuM3JyGLww5MQZgH4E9Q9ivtRuSw=;
 b=iTynK1Uv1FqOIFdVQoSc0NCIno1xSe4BgcfjtZUSt10XKoN4iOWHmQJ/
 41kM6pQNhUaXOGvSYHxOrTN3gg5LSdRkJyQ6kvIwofk6Lz6DDeSyRTzX0
 V7mYbnZX33sAJof2gAOo7cLnGGSQ5ay2gHagHqZb/i83pG6CnH6EICfxO
 K8FmY/BR0mvBmH/LJqxXDQ8wfUlUB+uGJEk8mtmRf/YA1fRL8qM0CYV4X
 z9WpX5VrzVU/0dMuDfFWgopn/6kdRmsmYo8J+eep51IZFr63NF+5JegTZ
 ig+KKhZwgrtXSQrNjvwxVg1m5MSz29hwgUlvobpp7B112949BLcgo97oB Q==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644561"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:25:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPZ+b1kZM1/FKrUt8WZrLPrKNU5o+5cCHkVJQXLJDR5o8IctJfj1bHb6K4Cp/GnJsBXBa/CLs3LqS/ipYm/oXDjBXLt8xHifEj4tRNcHrIiwsUtDpAR4bEPnUTUcVxJYrgRgQNtP2Dk1w6CPxQrsOKv1TM9xit3S25hJc6a4oMgP8ad7y/m5z/PyJXGziKe3Kimz44SsyjPKpcUR6KUniY//0siuvRhPeu6pKLWnH9kE/QYMzVhyWcIcwB/9O7bf74PRKFK+KjCxgubX0lUfsJSH81Rk2bYKUkRQR8hLeEOgIv41n8q+dwJIgonq5oPv1uATw0DZmUcb0aVpONt+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QNQ5YKoXqMsx29VCe9Vz1Hdnh5Ee2XltRgeSUx1raeY=;
 b=Vrj0qp20PBL+i4y1EwFl2mm/dD6473s151UyEVtq+Bhhy7TtaL/chP5zC8+brrAreLzox8wDr49afOw7jfxI9YFM0VKB4+axgcButAlY64t8ex7CqkbOpg5zJc75fEZXPDTSuyJNE8vu9zYt9rgt+a6tRGMOc0cSjDIqPDDLW2M2RJpYqKQB/VYEszx+lO5AchcR7OnqTJoWWOhlirb2fIXC+3NRZif4WTcFSmuW99QDcHm0/afDqpHU38qQuTGrGS0DEO8lG+HcJXOnUhGec2dYx3h0b1p/u3Fr2UxsocxlqTBN8sPpRuABEN4jzkQFnXh9mLgjOIrFPdv6W9Fchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNQ5YKoXqMsx29VCe9Vz1Hdnh5Ee2XltRgeSUx1raeY=;
 b=ZjPN4/SfuT0AhbvMEF4up2UPHV2KruMgLDo18fVM9ZciggTMpvi8HAeDoM5pBP2w8rqBhIPJ0lKowtDwD11BXWHXiz3ja7Qo/PEnqdsZqDq1fsMVtonorOpX5v/4NJUYwO1Yb+wGvC/5405TY7EkL66pDbJWNABr6Yz9mXpg28s=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7796.namprd04.prod.outlook.com (2603:10b6:303:13b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:25:49 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:25:49 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 01/22] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Thu,  2 Sep 2021 16:54:59 +0530
Message-Id: <20210902112520.475901-2-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902112520.475901-1-anup.patel@wdc.com>
References: <20210902112520.475901-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.167.220.163) by
 MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:25:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20b36688-047c-4bf6-88fe-08d96e046a54
X-MS-TrafficTypeDiagnostic: CO6PR04MB7796:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7796A3F36972EDDBD72EFA8B8DCE9@CO6PR04MB7796.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yMlHexycNSzNJQPkGDlYkZ3XhVSVvNr92WJS+O9PDtWSnZDk99qiQxNsUBFC8NkrqJV2+Js2GMSvgIt61099+/JJNKn1A1DNeqUBUBMWFK1vZECFjdiDglhL/iGCn+toVA7vO7K3c4wXGQTTKpLzQMfBQyxcYWu/T2uoaPva63dEBd4yeAaEJGtxOkd1R+IHQar2UGDW9LnTIs5677SIsdLpeq5fcNglUM1y5NZfIuEArKIAyRwo06/7cEw0tXW2hgj2PCDs5h028sbkHOyWWjwSDkcwFacLYkqO6uQ3EDOrvpek/h3z/ycAIIsTTRfLlzHpN6U7LaeMU7EB3FqKqrLqzAFCls2RwYaL/2eyT7SDo3LO4d0CACKt3j7zVYB+hprazIBSYLAAQ0JDG5+BCwG4Jy7LsULJnzYjAkMgvEoCtdZkZ65bCcx4GiaPyARVzzLjYM9L6hDAis9nc7fmAK7/gkf8ghrF3X0CBs8x5vAIfwjGnKN3RAEOjJRIirv6XXZN482M13kj+C91FlCbQRS1FzLdJoo18e7+/KIA6T4rEmQ95nncqtHNkEnND1de9F92hTgDlAs2xgt2Tmm7TeEItn7/cqC3/S9AQIy6ul6USY0M9h2jYXN5Ts9YWAtkd57bvYavTeaZ0zTnNQT5FVUvKASWcoF6KhTWAoSwYGX+V+jDPc+lMF4xqiS8WbQJv7wj3F8sw9XN7+njU2uXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(4744005)(110136005)(55016002)(66946007)(956004)(38350700002)(26005)(36756003)(66556008)(86362001)(54906003)(2906002)(66476007)(44832011)(38100700002)(52116002)(8936002)(8676002)(1076003)(8886007)(186003)(6666004)(508600001)(7696005)(4326008)(83380400001)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c0I9X+wWtgaqCmgdzFe02G9SdfZB6iCdzRtv2bEeFcAUS28cJIzP6gcgFX2L?=
 =?us-ascii?Q?cl7Aj6jWz1OtiZg+LlEkZ9m7x+7wPIXLvRb7rHX18RfppAWSl+eYyq+JvAPw?=
 =?us-ascii?Q?zvcYPXaHUv6d+2rJp7HK2cBE810+7kSC1Yu/9x+dCBAvfbq4CJZDhAbQ9P+N?=
 =?us-ascii?Q?RvBiXOfkDyLCNHgv11gRagP1dNm8+YI+l0geGdrRzrGztQQj+AIJAZsyCXgB?=
 =?us-ascii?Q?EWX7DkWlUHa4d18qn8SZx+7xUwOGrdR7S5M3s7bSKtFr9v/B7UoY6+Pa2mJA?=
 =?us-ascii?Q?UTtgE9CHFnz3gZNHtjTAWPHWR31V1UwiGZ6SyTw29d0ba/3ihDVSkc+Ioxnq?=
 =?us-ascii?Q?HRqUOVl9NqsT1VC55iTpmkATELXkpoYgr1ZjLhnUPmttuIqQVK8m7B1BgI5G?=
 =?us-ascii?Q?sNaJfRBsr9K0UAu5A9xdteR4PASK5BZYoYSxJp7aHpwtuc9dA/WKJzEmQj5R?=
 =?us-ascii?Q?5jDMGPy0kNavUMBzCfUHpcBX8ZPMVFCKLOXVAJbP/vjCVYrlPmf1nvYyDa3Z?=
 =?us-ascii?Q?Ws0KOCnTBoZG5YSZBA4hcGn4PifqawDm5weA6teC2vCn1W6I4z7xrHoepGi0?=
 =?us-ascii?Q?3aTzTUSMqavrbwriY4Zr82bB50Njl77YV9lrlfwQBPVW5m2dHB/5dBXC/jzB?=
 =?us-ascii?Q?K/bVn2KtTC7qGHIo2MebUkBU0CVkFg+szZtScYWHSmhW3HXWKgLeRHFNBkVS?=
 =?us-ascii?Q?/ts05jK3XRSYCoOnCUKtsQ/Hk7uPqm3vXQ8QbZaxZ8HidS1zitFlLJfCS4oD?=
 =?us-ascii?Q?HA+8jRSMY+sb4e91Ic4ppeviqLkUwMxOTxfM5eL1FeUPfmqRt1MbctvxvW+8?=
 =?us-ascii?Q?VBHA9W6mINlS7V87LWXK3nhAIfOBo/JH32G5UzhirZZITAOFv8SV3O9OfKUT?=
 =?us-ascii?Q?OD6CMgxOSVAHbdS2eS7pBdw26LMIsnEbq0g//q1BXhUZ8yLMT0kQQ7u6VISW?=
 =?us-ascii?Q?K2a6z/dMmOr/HWFdyuThUdN5CcdI4oR2brNiQlA0WYzV2+jBsR0KGsgB+ekX?=
 =?us-ascii?Q?emTUVnq4AIte3bewbmSFJBPhN90jh/QoEKIHe6rFVV881nGNT6BZxaL4T1iv?=
 =?us-ascii?Q?Xt3hLv6TX2yCvqdsKZMXhZakzpQHr0MsoHRfSWQ+dM92MjVtERMXn7kCfMh1?=
 =?us-ascii?Q?4R1TCMXDIPKn1tb+bfOCySVEx0PfEagHc6lBqaRLwxz0ii67UBqIfknFDR2a?=
 =?us-ascii?Q?IGAwFvEEA1fyp+S9LgttTdgyg7YnkVmQhzUGWoV0KpaOW4VeQdPps2V2syzb?=
 =?us-ascii?Q?KNfoLCwcj8YAXTAfkq8Z46a4miAwtdTHR/8HxnrQA03y79Ra/eevGeNILEXh?=
 =?us-ascii?Q?xCzrJU16uGThuaYqI7ANP/XW?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b36688-047c-4bf6-88fe-08d96e046a54
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:25:49.6139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VGay1LdI3EqmmrFK5JovSvKf7F5W8tvbFtXneLGp1VYvdAi96yPAxZFk0g4OWZpVfrDeyDdmYyQPpJXanO8AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7796
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 02 Sep 2021 11:25:59 -0000

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 50a2c3a3b4..1f13d1042d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -181,7 +181,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-- 
2.25.1


