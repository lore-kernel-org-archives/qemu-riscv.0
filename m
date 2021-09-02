Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkra-0001O1-NU
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrE-00013h-9X; Thu, 02 Sep 2021 07:26:13 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrC-0002r6-5n; Thu, 02 Sep 2021 07:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581970; x=1662117970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5lc5ViH7bF3j/GWZwYV/CYscgXAITEm3wodQUxRpHOo=;
 b=cItEj+iSZiniPTlKOMaYTTd38KbmCKjLCnUkPIc/2ndlybZYVv6KLYgF
 hqsHAUHu6Mlq9UJBjOQYj01gKPCPMKzkajRVTIeYXcAC86l64loHjpb7d
 gng0sw79/KOGVwJzu4mcOA2A7FMm4Wxb+NzBLVLDbmZ5CujFhP0oElm3O
 f9wl/hq3Qh9tEgxF9gKHHhhju5y/aYA23ob+u+WsKWNV4OjMlloZYgA7x
 Y52X1OGYDiY7wFP1Aeh/wAawwdgzdtTmdWZwXEyUTzsuO4REHQedErIIr
 Y/rLmF/MKj+yOnOIZt1R+pCL2pdYGMNXR9jI6lRoSZ3rHFoD999uamIDw A==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644571"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgwJXVEgVbqBkZ9RI/HbX3Pir0Hm9GCp2UsXOozM2JsW0BKsFD1PXE0AEPakchZAxO2iKS5tfQs1W+r32T+mxqaNwYHZiJi74qlkT9Q5slnzQfZtmpvu1KiUaW6WS0H0kWsPJKeP8tfJ/d0F4T3g6HMvE5B/CRoFSMRUgZmk/8nfbr1ZJE159rHziQhpv9JsaC9OIVc9NBAghIiKMn3C1xJaMBOLSsowmXh6gWMCjCnLoMdlXR+2cLGxRwt8AHqJPiaB+F6E1LJDJMWrVTNTobTkqaHKy1YnMKKXWr2ua9dTBAoKwJUw7Dn5kVDfOB3wrFI0QQaFznGWKZ8xBGB/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=caUw3x4t8VhG7+fx7+lSFzE1m5GgUvSPcnRl3MxzzM4=;
 b=aucWkH6s7WJEYPbB/gSlLs9NlBW8KvBeV8W8nGRkm1tFQfUPDPYnJbMwuGrVBFStHoLV2bFko7evtcO/4dBUfZxt9a04OimpNeznMvKBvXT4eL9sjqv2S94Fso5uB8fRn6v+zCzQyfyy/qFPHqe5/Aixl3NfumJyYV4rhwsD5ZYlfjP0PIn2eGR1ZUhjTTVDmiRupPltfuMlqo6A4+71uLhBWXh38y9NSmsw4BUxMgqCeARemMq5J/gQrsPoffRx3kBVk1zeT53dVpg8bEmDFX2j6N35W3IpNZ+SyXNbJUJwNaMrAbBpothUYo8eJKXB8GINXNixgGVRbhox1obBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caUw3x4t8VhG7+fx7+lSFzE1m5GgUvSPcnRl3MxzzM4=;
 b=F+3CWTX5d56rm9JDLO6Sjp5+qB6xRMrhKWTX2CdbDZIweXzW+tAHVWOkj3b4/39FX6Jn+Voxn4Zl7xdzxxln9POgAU98vFgaKhnFT1jOWOeii9PMXJYdw+eyb2jUTsnV3Cxytk7GlY64aHUBAPDBoZ96uXxQXBZxuixNbQnu6kI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7796.namprd04.prod.outlook.com (2603:10b6:303:13b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:06 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:06 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 06/22] target/riscv: Add AIA cpu feature
Date: Thu,  2 Sep 2021 16:55:04 +0530
Message-Id: <20210902112520.475901-7-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f49208c-9bff-4536-282f-08d96e047450
X-MS-TrafficTypeDiagnostic: CO6PR04MB7796:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7796A5222B026B222AFD56B98DCE9@CO6PR04MB7796.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z2oBSMMAqvdFVAXMU8f+rdl3xmX7ja/ktnYeSA19KGD0+IRJt1gpQKV4hncQa7R3SSvwbTuSXsBXwMNrC57oo2DeIUQ7KvQbD3Xt3IYOzjSsRU1DTdecZc2W8wTak2suR8ZHA0LqKUyCs/cmegY4QN5YaUgDtpjKW8YSaiv7dG4ZgNs7sLbIw9/JhEj7/L4S9GERhyhXxSZKFKaHZd8FAlp9mg/6VjmrLTEdS2GpF/rDXlKOloKbUqjWHp9IV816h/K3HeRJ7w5AZwK7T4oNEUFPzffAWHRbSBABCH+QKdVMqfWZgAo280HZs+QoXkz2pNBkBGSbGYAxeFFo0cUXsb7Jj1Zufq8x22TA9MrWKRKcnrVIf+FGEa/CVaGfJRZnvQnBX50pa5+REhO5H+L5VD6UFfeai9TX8U0KWxUTd03IW6190LyoV/caHy/B7Z9yCruXUgIiDjdIZdBJ8rpQJYhfVt7tyeRIchtfIsXLnDSWLmK3CJ879g0WhiIoy3IGoPlTxuWua9UJM1DA+pLpwH5+4UbtOkRc4YMzTSJYs9TX+iwnfIGpvW/4sge5UAQfTtYeeh/CX0zUvENDIkBT/PV6WxcD2Eh+0Mf+JP2kPGRSzVGqAoI7z9YWkPChwFL/IZ4Q6GSQNdiDK/mTcWNIoigSI3tP6fQb7JqpHgmIPNsTW/L6rxbkcWkfxWT6KHZE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(4744005)(110136005)(55016002)(66946007)(956004)(38350700002)(26005)(36756003)(66556008)(86362001)(54906003)(2906002)(66476007)(44832011)(38100700002)(52116002)(8936002)(8676002)(1076003)(8886007)(186003)(508600001)(7696005)(4326008)(83380400001)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?78YjhtN91QTxGbuDkS+QGS0nkXL1+KbIPwgb9HNWdGKPtPB1tRq7iRnyVzfM?=
 =?us-ascii?Q?IDiHrjbcnUtcU5PGELZa2nKaHA3yiefKkt5cW3T33/NgNaKyoitkk+I3OHkK?=
 =?us-ascii?Q?HgnQpmps6buREt8oHPnbODRUIYj06vE5+Z1jilTkoDFTQQ3LJnmoQea/49AH?=
 =?us-ascii?Q?R9CcKSiZYqBSBUsnj1UVdiEo6kxfFbbeCwABx98JeNYlhNQtpzAllU+Bafri?=
 =?us-ascii?Q?t9ACKHu+ig8MNFSH5JHZdhKhpoVd4c5mspZb/0/EYZoQfz8ZsLyVSw9G9Cgy?=
 =?us-ascii?Q?He6D6dFUyXht13uDTuRr+Phseo4qqtpTsOI7REVX1e3JCpk1rJQdYCiCutF/?=
 =?us-ascii?Q?Wuru+h3z2k6qbx6vJ/tpSvOHXEYztmG11hDM3vHjGboco7e7E1kXSUzw1/nO?=
 =?us-ascii?Q?kspl3kS/Bdj/XKGsGY3KCCnnuuwpZnRikw0JmR3mvBa+uNO1vY3AcVIb60Lf?=
 =?us-ascii?Q?oauQlAvETXVJNFsflk3303hKmlNUPwdX0P4NGeq6EOAJaatlrxfLrOqYi/Ll?=
 =?us-ascii?Q?r34lxAoIVMN4SeC9yA2bm98/x+d2vcjqJQXA+ySwB6EhJ17QwEguWGEmsgw7?=
 =?us-ascii?Q?lHGG+CHVpIBVkrp3CtL/De7l+830PrY0aNyo072P+f6P/z9vRJNhBwbXMH9W?=
 =?us-ascii?Q?5JVqCkLYbG9zc8IT+ZNBRGupP3c1u6nJwhhJt9wSDygdNbyk0iGsIUy0nR3E?=
 =?us-ascii?Q?WU8+dAItBGSTHUtNeu9/KPN1+NX43hOFK77OPcfsSEsBEl3Xz4h1ZUXGNUCp?=
 =?us-ascii?Q?h0hVv7SQneSQcoYkvh7SK6jW8yZlxBxz+0xroJr7/e/oV9N1EG6JEuvW3jpS?=
 =?us-ascii?Q?cYxpEcWfMCFTTrD+DhLW8Y4qWZ89qvw8ZaAANx5jTtrLaXbzgnIs56L+apZ5?=
 =?us-ascii?Q?PFUIASv247hO07V8oPDOJAnig9raD9QtufSzVP24+X1GeWKVtET7QM0XZMAR?=
 =?us-ascii?Q?agV1VPm3YuhPvBt+WDMn9PCt+nAS4OD1ehDDVjd2Zzo9mEuQddmrsTeai81R?=
 =?us-ascii?Q?EDkXE56BDl+wp+7crxB7g0V7t74ZJ5Tdh0E4eiQDHy2JHB9hQI8DcWdaQHqK?=
 =?us-ascii?Q?qy0znMjCdiX7M3ysRm+Gqoo0U7pEXLKckGJ+ZdyndGZ4m8yjbLrpajZZRwd6?=
 =?us-ascii?Q?If7e1jqd2eFCOiklCY7HD9301crjX0C8gMI2+0y//ayE9DJhZVYXYM2zw3P7?=
 =?us-ascii?Q?HYjpEmV7XAqaNMc/N1hAB0Ny1/sjW2E8myxum4ohi88WkqAUgZPi9jYfm6eC?=
 =?us-ascii?Q?9iT+rOJsmgUwJu9iiXKEI5RMSKBh8vhu4Ouc4GfGiYC1X/RoyDRk2aX8Hdk1?=
 =?us-ascii?Q?aDDuFx/UW5cPLFV2JzNzCKOM?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f49208c-9bff-4536-282f-08d96e047450
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:06.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwqUTG06QaEi9XbTvqHy/DY9qyaa7+u+zR/8iDNi3l+YlOSjWIKkQrXP9SsGqmNpLUR1f1s+yG4GwWp5/t0LiQ==
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:17 -0000

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6fe1cc67e5..2cde2df7be 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -77,7 +77,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
-- 
2.25.1


