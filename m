Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBB-0003Eh-6q
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB5-00038B-Ux; Tue, 26 Oct 2021 02:43:20 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB3-0000h8-C1; Tue, 26 Oct 2021 02:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230597; x=1666766597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Nx9wCl2PjPZzfxgMbTLUztdO8ypGA2pn2dH8yP9taUo=;
 b=VOg0Z/77NMvvWj/LHvbsM7//mQwEPFSHUPQBD73VQAM6KXU1E2OdztLW
 n2gDzma6tvEYfBRLVmieZiHFfqHwKFWZJrL2erhyfp4sOmImqzCJzCYTo
 I49njPteaxSGP01U648KE8n1G6re/IW35LW9W4eGeFtfp5O7bLtkorvWc
 4exy8Jgz4CpnfMRYfjJvAqlu0PNGLNu9J4HudgEaKqPqWIz2THlNBGrv1
 Swmyej94uBwjcKS5T9POqh3eUa5d1+Vi+Al/PHW37JNJEx3v9KQRvhWzg
 CgQqIEw0tA2kroVTIQVcYTTV3t/RFxrEo3IZUmwOea7GT2StzBd0GBFbm A==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="182854749"
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Og1Rnbt3oK0DnMX60UfWyd3YtF8aQJrwjL+BjA8q96zN+P0T4dtWBIulbbFotKrATO6/2ej50QCeAiaHzesfZM3gefXf5GeuT7qCIrqo6csg+l4SKzVoePbCHrsmyN9UlG2BCd+3wgLxQw+TyAzdfkEwWhe8zGGPQ6bJ6DE1KZjgzb4KByh7BKMRlqH58CnIyyxruLofUpq4bOFvN9VUCbV6IRBvQqd7fqeJZa+fMKmFQbrVVFfFGt9UuJmZamTmUbaiY3LrPwbZtPhjz2rJQy3jAF76YiGB8ZjJn5tIfzlzVh68x6a9KTqR3bDivRHKam+dMY63pSPmSBs1OG99cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To9GxHvfKRpL30vajheq0UdXgtqFpVnZyox+gEMsUAg=;
 b=U9KXZq5zcFXD7wIF66uZZK/ChGohdriQUUSflLgjmpGq6MUbaEonQufyf4VE7DjJOXt53/O8jsvmITT6gESnhSlwyhZ2inu0R06Y1exOKEPtx3buJdFIIuCG75iQLYfA/0p1Aw630rjuixypB9ckQnAPi64gAy/HUYI5smbhfNxZil9LurVdnPT40m7mkuQYyZ1663CcJ1YiNWl0ZfcuYawkJlI3TXufTq0cJ/MlO4t3qIaDljGszuWBRb2NAKC0k7mOa8FI22uelKQbEFvuYlmILSKVmaAMfpJi/T1SMusoRF0xGVsFHpSRpHsZeDhA4BVBlbqXd3JO5H85dvWywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To9GxHvfKRpL30vajheq0UdXgtqFpVnZyox+gEMsUAg=;
 b=VMw+Zk8B7mbkR8R9kpdQUexOFPR4gr+y/HKFjt/8c4J3+s+7cd3O8t55983x76ABcijA9nzTsGXwY1lHfPwSK4wWk1+Mi0tYO9+cNeZyVz15bBsz4wXo1qjfOxr9q4sJsFoyNevUZTLRl9VSlo674kdyONSzG//NZ6Rcw0uZbxg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:14 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:14 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 06/22] target/riscv: Add AIA cpu feature
Date: Tue, 26 Oct 2021 12:12:11 +0530
Message-Id: <20211026064227.2014502-7-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026064227.2014502-1-anup.patel@wdc.com>
References: <20211026064227.2014502-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.162.126.221) by
 MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b3f02a6-b41c-409d-01f4-08d9984be26a
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB837919E74BDECFB02E2617AD8D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ta1EjPMkneWLGQUf4Aa+rObNjCumf80KZZ1FL7lEollzawCDH+uwhf541NyWK5be2ZdsXoaQ8PiICIeu3bh7dJ+zKoiPLKrGIHAQujSU8TSmTAjjpoEPO/WaROEiqTSm2embUVCcrzQmxGmQVmi9DrglA89O26F1hkz/2NBaIf6FZcvUtVIiQnFU782TU6XCw4YyxqOoK20N5VC3p6MSbEGGl+c/kgIFbLXF3jjYWfsM3xG+PHzDrhjM1PunHj2aJ5Xf8JSyRGcEGlHF5Ko0H4t1lIYGdGssKyf8crrjynmT9tZX6u1Uk9Isrs64GuLEvXWIWkV+BLK29hK99OCgXUE++qDO1Oap0ftZW5drNGukG+FOWvS2MOf3nVO1M4S3OYn4xKMuY5xB7gnclxk6H+CXmbfbxH1kI0mKLUoVLJaEaHjo48idBa53gGxD45QuxycCF2oSzTl51R2SpsYPqv1KAEJajWXtwVaw9NY+onb728bMsFvrEiutQJWj1ljYu3WpyEinaB4Aikj3PLDn8bd9aKP7Rl1JPogZ70haePBwhfMAp5Bqe6EdnehlE3nHDYq+otC41a+dEMbUpD0uA8lb5XslzgbP+kQUeDqQ6NOURavoZakr/1nJhODKhWbrjSVhJlcLmTYEP0lQsCuzkQKeqp+a62IyueYTT8D26mD/4LpclmC+5ATJvrg1xKKb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(83380400001)(4744005)(66946007)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G9GZb6A6QVa5AHl748qr5OTJ94Iw9WK7Aq4k7uwuekkH7v+D884qtMhHG/n7?=
 =?us-ascii?Q?iXWoic5bEHD8xB/6Ej1HiCoVhq/hG4AKIU9D5CsIP+UHhUBwTwm6U4HZ/ClQ?=
 =?us-ascii?Q?pbaTZUGQgXCmsPgGISBqfXM891pW3UV6VbLpUwNrpcTJtpBtDw4HqYYUb5HD?=
 =?us-ascii?Q?u5gDY6vbfDtNMqOCBV6BP6IrXMs0tn6MDAzZ/DgEgNJ+mLIrT2MqJMbKNAfR?=
 =?us-ascii?Q?00XxK8XJapEBMYeXpp8zcHIej6GTnyRnuFw/DYvaYwAh8FYKzZmSQCIvHGZM?=
 =?us-ascii?Q?ZsPGqSL+rpsuswA1q7uEFeZVvDBnmhbCAXzRfDOZo5t7XZrre+Jcv6iEYC7w?=
 =?us-ascii?Q?2hbeYQJxfbsmRXYxpSIOHjubdTsTjNzI1Xd4DyNBizXrEOGPYVq5LVWjuVvo?=
 =?us-ascii?Q?nrgfGG5JTx1ejYwky1LVVJV0b0O1jTFH83mg7gKJg0gBDzyiO2pjI+ywM0yn?=
 =?us-ascii?Q?FnFsCLN1Hj//llUkF2rl/cAu7G9+AdfQSo3MAL9aBiRt15exzuuoejOXt/CX?=
 =?us-ascii?Q?ZtSv4nnFc0NYH6T8qg40dONMEGjJNjyLgiSqnE4ZvkYbvYsqkhu3FTgmCrzJ?=
 =?us-ascii?Q?WpUnxi9nMWAzq5s+MZlzo0Xl+Yf9uAnesOpz38tsG1O+voIQrP+zkPxgxkvZ?=
 =?us-ascii?Q?N5oKncczkJ6fumNoSzaHRDiUQnefqhTUChjiKcgNkSlL4UQgFFjc09euzx3R?=
 =?us-ascii?Q?KvwmXFKnMFJieHgpM7PP4t3qiyt/ggWVm3nuIa0vHlPq+ms24+o3cRgQ6RkM?=
 =?us-ascii?Q?1yioTS0fEAdO9rUbLkTBJYxjtluRY1r8QZY2jkf1qH2vIsydnp6ivYWWVEdf?=
 =?us-ascii?Q?qQw1a7ozT65KaMQwSw2RZt5KRErtjZRb6mmV43Wh2YhumS2tNr4L+nE6/W1p?=
 =?us-ascii?Q?KD4qgLBlqfwWG1NroMB4dmv3xnKQxIdZKhwVdiLp+ilGo2b0hNMjvCNKX0fC?=
 =?us-ascii?Q?kLXdvmfu3U0SKS768EIy4C7T8VgROj3NbxGsRbkkYTJ10W5bdiUBPZpOYDY7?=
 =?us-ascii?Q?aWU2i+jNyA+Zq/wG7Muvh/cPFd/pA2jKBkBiq+RrEmgtm+6pbAhzSCFz3eEt?=
 =?us-ascii?Q?0dF9EI88fROGsW7ceNjTwJSmLUxXWFzF8yxbTwvrl0CVyo1HBy8v+TO0MK+d?=
 =?us-ascii?Q?77Sm2lE6RV7oNzeVP6PtsraFX7sWtBrdAg/73DCXc273Kx9wMOxSTK2GhARE?=
 =?us-ascii?Q?8ZBWYTzV1VtTq7my0Z7j6RnopS3BX1zTg2dHxVvh8ZJ4PHETYes23s9RrlyM?=
 =?us-ascii?Q?IT2xVZAERxln+8n7tvuA3AjvXFKZaVcF+aR6FRb48RXXXS5xkBhQl/brjymI?=
 =?us-ascii?Q?h9z6PBP9nMBbn7S9cFviTpqmxxW8Uwsi3/9e4w40d6oA+SGkVB36zhq5WFbB?=
 =?us-ascii?Q?DQERtr2cb1rjREq9IL1eBY6t2o4lLsVrXa3Y9//sA0FOhmK5QK8xeMf9By+x?=
 =?us-ascii?Q?spwh6mIS5K2/WZgqMHHaqNnHJ/q/BaLD3Mx8ZcPjmYAnxsu7k9aVmA04gSlR?=
 =?us-ascii?Q?0dDi1cKN59k3evGvfwTH/9rcKby5DpMKH5LwU/B2jLTIlhSDl3nh2jHSLUQ+?=
 =?us-ascii?Q?I+gye+qGIdP7AyFskCKSxVA3w9/2P4b+9g2MPB57HmQxUNZTjCMSnmgHwPKA?=
 =?us-ascii?Q?1NoFuCG8Daaf4ttZIJ00HEU=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3f02a6-b41c-409d-01f4-08d9984be26a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:14.2673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD/DZ1ppLixenj0GAFFoPNeVtyy4H90zZ8Xcy1FP9YkMEE6DK896jQ2mjtXq6/YK66muQ0qpKTMHZ3/sNRDS/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8379
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:21 -0000

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cc035a8897..7182fadd21 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -74,7 +74,8 @@ enum {
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


