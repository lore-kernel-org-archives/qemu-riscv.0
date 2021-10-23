Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meCgp-0002HV-7k
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgm-0002CY-M0; Sat, 23 Oct 2021 04:47:41 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgj-0006xZ-Mq; Sat, 23 Oct 2021 04:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978857; x=1666514857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=z3qIOXYfVWykrEEtE+DZx9v+O2iQ78PhkBTRuSZjnU8=;
 b=cmc4gWJu1Ep93IU/tbvSJFTjvtyHMCmbAjiV1maePHqV+ypcnT+vhulj
 hY4M3dc9/t+3Z6TWUArZqylFVYrnn4N/BCgXoeThhFULyq83eZi+2oh6r
 skj8fSb1Ewa+oQJyPKmfO6MfvotOs4DQK+kZtPg/h1WAapaaUGuA68UWk
 2ml6AAVr94D49VnRdY4lfxMPY3k0S8YFgygkdkgv7QV6/aNXyP/hxMOq1
 yiyrgiw/UJBZdGBHmuY/UwRLVnhTZh/dKkICAEgEbIQ0uNxGnsHxKSAkP
 AC/5/tdxUNorp6reXEtZvkXPwf/AGxv3DwUZdk4dmGau+aeT5ky41ym0h g==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="295398050"
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msVIqjkCbGlo1nqTRnjW8yXSTxEUjjU4n56usKteL1zv9ffhf6wMmrgMiYOkUD9Q8VZ1fJ2com8msoudI5EUQlcCkwQZ9/DELDFlYCRI2DL97yk0jVDTdCzmcmdNLXvQvbd1tsCzVFK82pab+W5i4WakaWGGlMwSISDkuWC+de3fJWzeKmsQYZdCDJdTMA3dAZyAQZAkTYAklzCGylow1NzvQqYx03EwcfpJHB5aJmK5pbwtvKcDvExPUj3rLBqVMZsk3nJ0ksbfMqir+iczj4fPPAyGi4YiaVXWaCRt2+tZIDYv2UTZb1pBp/i9IqAJiMFmjEdr5PBavOk+JQg0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL1YDusRsyUzrz9kwwbmLXyN21mUnwX+DADOnb91Df4=;
 b=E7sW9BIrZhYCk7B9a92fG/uvAEq023RbIYoW7Oq27h4qMo4p0BCtrv/YPjq8okfFeIdusecfTkw+maD0QBVE7nM72v06PrlpBFyAEN7RZKujML5NYHvoRqex/ZzEngx+2jIzd52UtPzkT10GPL/7+wInrwEpJWO628pCUBnO5z0KWvSH7q/TNdu55PrDIioLbH9fDGa5vshp8TjeybKkHgrZuCcoVixHqzus3SoYxGjmcUeuePyNdhQtggynI1hlbd05CYqTsQd4//stKEj0My4TZCjZdLsOHs6sikWakjFUM1HG9DSj9uj6+GSPcA1CazIttomYCGQjgsM/ZBLR5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL1YDusRsyUzrz9kwwbmLXyN21mUnwX+DADOnb91Df4=;
 b=w0kpnPdjj+Z7nU2l+1RoeH3iYyCiNgZHIHr/WPCZEPmBj9UaEJfz5UTa44t24V58u2JIavvg7oumvpBHiJkt8CIKnd1kmLC2Wfb9WcPsG5leNV9kZYKYLio8FPo3fZlzy4B5mxaCQ4DzvUTV4vLrDqskv3RB0NqemGcCekpLug0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8345.namprd04.prod.outlook.com (2603:10b6:303:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 08:47:33 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:33 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 04/22] target/riscv: Improve delivery of guest external
 interrupts
Date: Sat, 23 Oct 2021 14:16:20 +0530
Message-Id: <20211023084638.1697057-5-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023084638.1697057-1-anup.patel@wdc.com>
References: <20211023084638.1697057-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.82.21) by
 MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d017869-ad23-4961-b3ad-08d99601c152
X-MS-TrafficTypeDiagnostic: CO6PR04MB8345:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83457C1BED849BA5AEF11A408D819@CO6PR04MB8345.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vqOIG8dzNRZB4lHjlTpwB0vGy/wLv5gK78+A0tqck5gulP8+AwQA8hp4MSzsBXiAB7e5n5y6gYQ9TCkr910vORvyxsXZr45ir+9v7/VPGcSDQfrEluiRrM/0gDGZ90SVMK1HRzpW609FhcKrej2kUiznf5A3FfM9ovnuc5mCng3dgLwA1QHNekU4ep9JGI35AIY/cV3EteGRCN3x4MvP50JUCfZK3eunSdZR92UM0G+YZXusY3yoWKnFJKyfKNjxDxQb7jAUPVq0DVF6Aea+zVcLsJ2dGjnNqgN+wTPPAWIyw5ekYQZsxwNS6SmFi2OZb9KaZNBWYwHJQnrgOfLAXjdoWPhIVLw1OvCFuuNCmFGUvTZUtJYolxv6jnWvqofBdaUMhtinoQlTUwMuMrOLNr3vAEk3W23h2BB9+x+BLQUCbZfA8qj53Mw7Nra/eaURtMXnj5DLAimA3DSzVLjO7JRoPnb+Q6TBIFb6wE9y9Oe+oviSItcQgggttnOPJ5RQVWsc2gNOE3a5uEp/Y7ts46yZEEUky+e/qDswJeOvUKn7z10HTRpqbvtOHLLFIggXD/Lyr7w/JxzOhSW/13K60h1ySfQAlPQa7eT2b0Nr0AFnK7q+SFACbmgOUx9fFHB+9Jo9uqCLJe8NbskFJIrLUMaM5BuNTZG4SyBCGkG7rjpYkpr2TNQUCksQAkaFDEz1EdMTHxMv5zY2oeidPsKPAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(2906002)(1076003)(55016002)(52116002)(316002)(6666004)(2616005)(4326008)(38350700002)(5660300002)(38100700002)(83380400001)(956004)(82960400001)(508600001)(110136005)(26005)(54906003)(66946007)(44832011)(86362001)(8936002)(66556008)(66476007)(36756003)(186003)(8676002)(8886007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lCw4kETka1wl8wPfi3gSbDQy4QPOJiDVsxawUId/MI6hkyU/46p/2mt883je?=
 =?us-ascii?Q?/4uvj2NAjW5sB9vV34XFWwsDkmruEo7Ll+nq7CEPQH8nvcqUl17VsgXXNmEe?=
 =?us-ascii?Q?CRr9jYu7NV5tZH8/+3TBtmFJ7VtGk/pEDdomQnBOs3yZwsHmZaq4GxvH5mBB?=
 =?us-ascii?Q?GL1Rsa8bPJxlSx6H81P1fAPVluOzhDj7OqBxbaacOBYsoAxqz3zAMu0qcgIS?=
 =?us-ascii?Q?T8Rs7ioF0LVj3eavIatKQgV8qAm9XGIQY3oT7NxumgHhCjJlucAGaO+0Zv/W?=
 =?us-ascii?Q?JBp6siHQQaKFcHMes7Lt3cB3ih6polFTWYLaVfZGmV64qMMhmJ3t36scZKgo?=
 =?us-ascii?Q?nVCa4QZRU+BAu6qxS1GtAXzZ19KYDvgM/Stn4DFjvomnPo9CGfKYazXik0gX?=
 =?us-ascii?Q?i+g/ZZc0dKAWoplyexcoAVfmIE6ueqw3jUnyypSLtvCCFit5D/GsRoGs1ocJ?=
 =?us-ascii?Q?JunP7NUnbKJO9MsxiEq6xHC5giNZm6weMRXdqL6Zh7L5UxgCmP1/c8INov+7?=
 =?us-ascii?Q?qKrfFlneEbuk9VuTml94ZNB1gpk3SD57Eh9CB9nMaiuXZcfsVsxF63XSORva?=
 =?us-ascii?Q?0GG2itN7qqtLaGq5u0L97poU3iOO7yyTHaC/sY6Pt9553h1JOtrISHbdOk43?=
 =?us-ascii?Q?dDAxqZb3btH9IZ/ygQrhnfLf/i5LXJC5ZPcCCFVtjXFIkTQule+TUDu48RjF?=
 =?us-ascii?Q?OPCqCcS0OlKtxpgRyhMGgVz1l+XJDIKN5mHs2aVIX/CcVpJxAvthSHrmz2Je?=
 =?us-ascii?Q?es2ajcg2Vv+mnu0Ti0fJ8gzYUNMdJkOKUtgtvb0jyH67as+sH1Y678D4X7C4?=
 =?us-ascii?Q?zRtmrezGbk54ulgsxJmSCAZpf3Q2SFsdzfMs5kL8YnpkmUHU9mQFnjL4YXiP?=
 =?us-ascii?Q?1NZ0MgpQ6tyCJ+vmZMH10hwxinAg2YuFkk8GczUmI6u8Sf3MCFII7xXGhyEW?=
 =?us-ascii?Q?5uAlvBCID1rxhQnQksKi2RLHfSfzoSobsRNfj1No7f2MreWHmpN8tRbw5KFD?=
 =?us-ascii?Q?iJ4K/pAdJKyPNz2jGdq3M4TT6gWAzdkYXxJGQZ5B78KnVbx9cMj0AU/uW4J5?=
 =?us-ascii?Q?LyItNLNYOGC4XlIiO2JmLJ4WykBNOPVZftHK1KHtb0xUL9G2t1B8j2aatESU?=
 =?us-ascii?Q?6BqAOOi1Rsx1asm4xsaJDKMiDE9OR45f3YtdrxJ/yltP9HHRV0B7OXv+hZY1?=
 =?us-ascii?Q?kiYP1R+7134rcVGZoydvetM/4pmgkN6EFiwJvzYfUsQlW9TNMXQ+nbXKKLMt?=
 =?us-ascii?Q?P1SkTvAVUsqxAavvGQTlyzA2NhQfF6s5oaicWB0iwE+GHwisK3H1erjkvymn?=
 =?us-ascii?Q?rBBj8umK/7Ma6ZusRcQqoYuHKpXqB0rc6xOeSc2dJ1erv6HEgfZyqVxMrdEK?=
 =?us-ascii?Q?uDot8nzBNJ5AR2iYMYBBBo1gGQtroMnXNcrA74lRaOSm9rkdxAjhmXbIUwg+?=
 =?us-ascii?Q?kZ3ZhOxBHiWUcChVPt/3ebZeJ9XZugS4mysbQxkqdfS/rMhrQTa7AGzt63ys?=
 =?us-ascii?Q?2IcMtGCEzZm3/WdVwDJRnE6hcHuO6+cZ805euSp2+zYmPSjLedbryHtACanB?=
 =?us-ascii?Q?7yKccMqGnWDoGBOC8yJwLuesrNW1RqFFh5FqiJwPCYqOdAULN44fceHDLlZ5?=
 =?us-ascii?Q?ywiaWODrT3yjMSA4BpCgn3Y=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d017869-ad23-4961-b3ad-08d99601c152
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:33.5507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sZFwdO4KGhyQIEecGi5d8T9IxkZyaxfb9Ws70O9fI0WOFuAVCAT6XB1a9LO51nn4PPQVact72glidVz2DFBBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8345
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Sat, 23 Oct 2021 08:47:41 -0000

The guest external interrupts from an interrupt controller are
delivered only when the Guest/VM is running (i.e. V=1). This means
any guest external interrupt which is triggered while the Guest/VM
is not running (i.e. V=0) will be missed on QEMU resulting in Guest
with sluggish response to serial console input and other I/O events.

To solve this, we check and inject interrupt after setting V=1.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index bb7ac9890b..04df3792a8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -287,6 +287,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
+
+    if (enable) {
+       /*
+        * The guest external interrupts from an interrupt controller are
+        * delivered only when the Guest/VM is running (i.e. V=1). This means
+        * any guest external interrupt which is triggered while the Guest/VM
+        * is not running (i.e. V=0) will be missed on QEMU resulting in guest
+        * with sluggish response to serial console input and other I/O events.
+        *
+        * To solve this, we check and inject interrupt after setting V=1.
+        */
+        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+    }
 }
 
 bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
-- 
2.25.1


