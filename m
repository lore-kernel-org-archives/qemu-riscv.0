Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhYsa-0000kl-C2
	for mharc-qemu-riscv@gnu.org; Fri, 14 May 2021 10:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsZ-0000gO-9Q; Fri, 14 May 2021 10:33:27 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:34531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsU-00078Y-97; Fri, 14 May 2021 10:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621002802; x=1652538802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GZeFP0jcMeypNdrTJrmH3kYY/RUR2K6Swu7nMPolMqQ=;
 b=SMi4CuH86Z4Z8k4s55uj9BDniB/K5oSx/Szs5k+D09Km+pAShNSkX+sm
 RPs4MQWCTy2wekXtimOyY39CsfIUhXYmfbeL7AYwGukgCkZzDQmVw1bov
 lHLOIMiM6dPsuPXwyKRD3Qhks7IXVxhY11XNJpEFc8EbCJP/NxqnHGR3U
 TdHWUdlDLNC8hupU8rprIy76M5VKgE+U/1s2QV823IIirDRLATAYPFVgx
 Duu/Dz/ztSPy+VH9qAFxRbRNdQWLeuCeYpPVGNpIezhzPnMMkSCyxaho8
 XeaEuikLGTMVdgvXoOnCxezdxL+vNV2kJATdtg1BxkRclPv9fS3mIhNOg A==;
IronPort-SDR: WV03M9TuVhUV/lb9RE6+usIzWAfgscCKbgVpbBxQXW1euEYQO4aXCH68NHX5hUAgUXAn1pfHKp
 ac4mu+G5Gl3YlqASuY5tEK1uj9pIXWDVOCJxyKwh6uzBBa1A92yBbSH++bamstcF4HP5hmgM2S
 h9QJ8MloR77JNli7hF0McJxN4SU51rMWLrlOMqcF396CmLBl/2vv2UcNo6FSpt5OJKvNYJ/LI8
 B4weFyyczvcJnEjF1TD2Iqir/cmiCrtSDUQtZYveZb0btFtXVJA8wi+2X7j3ZD6y6MCW7uoY6K
 v48=
X-IronPort-AV: E=Sophos;i="5.82,300,1613404800"; d="scan'208";a="167526807"
Received: from mail-sn1anam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hgst.iphmx.com with ESMTP; 14 May 2021 22:33:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kc8FWEEiUmBYji8ISlLsgMjrMm/2UzGdXd5LybbxZLGSGDeP98lWzD9xaSU1b7KVYxm52nPmtC/TspoDC/a6DDFsja1WTAbrlwkwdlhOKtiC9oMp1VeywkmL4n7wslI4IvrR0sH86vc03BtSMd3Y/MmptOM1VMJXwN60GieOqtuYOlZWgSrr7YTPcB1FjuNEHu1dPiypOJGkcN1icCPym0pYqJgGRJbnjghiR9fLYeZ5KmEQfIawanWMa2CpTCJhZWjifTHC7E5XZD4jv6AUAR9/OE3PCFxs+QwJl24jIVZHr16a05tRgEkSb+Vexv/VQwJKtkdHM3Z+sU7ZyLtZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXLfpp7HnkV8q3AncSMjFHbvZ1QNzRsnyXIUpz9ibdc=;
 b=YpGo9YMTAv7ep/naF32H06EpsKgDUvJJj8oOu9oQy2Fv0998c/ukctzKWftRiBCyj+57GTQkaTUeGmx8qHiYg+ftz/SWtdEoMDJt+ijOvI+Xx9vJMxveJBeZJcb+pcbKGTZ/jcHIw+kdYReSblJ5V3qBnZzt7dV1GCLlLAzqTEt2TUmGr66jSsibu2bEOHv0RJbmX4SjKePeHincnB3pPyy6Ne21InOCy9wPtZ667GfHfFu25wZjLz10kgIlGllKt0FgAMiGODIMqZBP0RCT91SGxDqWufIOp//2/G3yZNFp3BowYOjrL/nuqV7Pd1vxWBY5S5Dpru8a9uvS1psorA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXLfpp7HnkV8q3AncSMjFHbvZ1QNzRsnyXIUpz9ibdc=;
 b=sL8qI9FnR1RA8o+H9/yZF7WLWthiewvWSiF69pPbp/UA1RR5Gii6lRfqYEAqub5R1v5UuTVkRX/gxUNNQgIIpAS0KJPWoPz4j9vHGinHtv/ehKP7I7DzdNfeC3TN2SR9NucaQjzsSUFTaYTCaUTsmrke4o19vMZUayuJduOH9ms=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7810.namprd04.prod.outlook.com (2603:10b6:5:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 14:33:18 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50%4]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 14:33:18 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH 3/4] target/riscv: Implement AIA local interrupt CSRs
Date: Fri, 14 May 2021 20:02:41 +0530
Message-Id: <20210514143242.377645-4-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514143242.377645-1-anup.patel@wdc.com>
References: <20210514143242.377645-1-anup.patel@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [122.179.90.73]
X-ClientProxiedBy: MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::32) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.90.73) by
 MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 14:33:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7109d883-05fc-4675-9e90-08d916e5372d
X-MS-TrafficTypeDiagnostic: CO6PR04MB7810:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78109C0E3BC8196BBEF809CF8D509@CO6PR04MB7810.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UB/hcNc3IZScbwn8P14T2yFOJuKLn4h4PTO9Y3PBlaEWdEdwRJ0SAO7LuHTHpdxDN0Azm+785WLsBeNosD1a+QuU3RGwBP4f4bofBs1p87/hOubBuH+wkSYTOADQ03CusbNdcamHjYSZvGMapcK9jK2Gwfz45SbIangNhPSCxu7NLSFalS7vTc3y/KsnyWolC/6LFivqsqYG4RZF78OyXb0DZuLfAp1m+XYUd3rgs63rB2CZDD96aDc2MVWiwlI4ECfudlax6HXv8Hx1nmCbLsa/KeY95fOQLHcMqcL5Bug/RmuSwK/A0u4Ac7LqO0SMECMpcbsGcz91jgXiNMx3bHRJw9HMxVjo+UHgtllSLvSb91nAzA2X+4sv/SFKjB5tb2TDp/1E9gsNSmqhe8n+Gt7Y2V5lFykyqd4E+zBckaVOQ5HvE1aXQ4WZSpBubx5qRCoFmz22rQcjPXGCHDBSujVtK1hUNlSP/Q4HFMhIuH29FAX/T9GJ5dQRrkrcjUDZ88aNPYNc7sb8b3HRoX+EjIf4AkFvmhwODgQ+RDxhycxjqmvQZYMl5q1x918qXOJR4U/cfQwwYUutvcCHYsQhh7AgD2bk4TmuMiU5I3v/fMm+XDmPZ7CmzKuNOQiEF/Y7250OmnUeHCoIuTCuIamCx2ENEDCGgugPrG1KHimb0P4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(136003)(376002)(366004)(52116002)(7696005)(1076003)(26005)(30864003)(5660300002)(38350700002)(83380400001)(86362001)(66556008)(478600001)(36756003)(8886007)(66476007)(66946007)(6666004)(54906003)(16526019)(110136005)(186003)(316002)(8676002)(38100700002)(55016002)(8936002)(956004)(2906002)(2616005)(4326008)(44832011)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WnNheUZ3SjBZK1JWYWpnOFN1bmYxQ2ZTcmN0YlNYaFBDcUREYmZhdG9WVlN2?=
 =?utf-8?B?TVNMVjFXRExocGg1NE5vdlo0bVJjTWduSlp1NFhLSkJwZkJUYlFQMklwZ2Y3?=
 =?utf-8?B?L3dUcXpWcnAyaHRlb2VGQlViUXBER1BxMjlDbHZvTVpYL1Q4UG5vS2NrU1U3?=
 =?utf-8?B?Z2N3K2U5bmZQaVkxaGtDOXlSdW4xYUFkQjNGZkVWVWttUm1IaUJSem9qa1Vr?=
 =?utf-8?B?VFFmcnV5V0psRXpja1RjaFljMGxmL3RsNkN3U09jUVZBSmRJZFlXNVpvWWNO?=
 =?utf-8?B?VXJPaFdpSjBlOEFwNzRuTUVUSytqbUJ5ck91M1kwYXVKWGwyNkg1c2JEQlA0?=
 =?utf-8?B?NVp4b09mRlBSaVRicWpTak9QTUV1RHluem84cXFvUWNVK0xKOS9NYlU4UGVM?=
 =?utf-8?B?TFY3a1lyRkxndlRzS0plN3ovd3p6NmQxbHFJMWJqTGhmc0ZML2tZdGxOOXlw?=
 =?utf-8?B?NFJIOFN4a0h1RDJncXJEc2t4ZnV3QmUyZ2xIYXNRL24xbEhjSGFSVmtrTmtI?=
 =?utf-8?B?RVgycWxhc1lROFJJdkp1VjVSNkF4NEtnMHF3SklSQTR4RGQ5bnB4aDJoOVAv?=
 =?utf-8?B?YTBkd3FWYVIxOHp6UXlTOWg2SUZvZldiRWFiWU5ZbFpwbjZ1MllHYXo2bUxp?=
 =?utf-8?B?dFVNL1kwcHljMkRxZWhXWmN1MHlkN3NsbFU3azlFMkxjbUZtd1RDcE1FR1BN?=
 =?utf-8?B?VkVYQkY1d0k3ek9qZXQvQ2t3Q0JNS2VidGVaVDJ5YTRwbks3ZHJoTXJ0SDlp?=
 =?utf-8?B?RVdzZXVEa3MvaHh1T2JGcVE1djhWU0VCTnFWRnlPaE9YVFc3cmg0YW9KU1Vx?=
 =?utf-8?B?aG16dzN6aVhCa1QrNzZQQTNsU0o2RmRaSXpGMnczMFpHTFI1OEN2cWZWWG10?=
 =?utf-8?B?NHM5d21XUVppZkpqbW5ENC9hMFVLOFRITjBvRTg0T3RlZlJ2Y0J1dFpqaHBN?=
 =?utf-8?B?OU9VcURCd25BNWhGTzREOGpHdVArZ3VnTjliQTN1dUlVTkJISitQSGY4ZmVU?=
 =?utf-8?B?SGFGcSsyODlGS2g0T24yd1BOQ0VrSGw2TlJraWFQSVlkODRyTE4rMEsxVUhV?=
 =?utf-8?B?SU94VGFxMGJqa2pTdkdHMlJ5QjVOT3BBQ1I5dWZrc0I3QnZ3dGhKeVRkUFV0?=
 =?utf-8?B?eU1kSzVCbENyNXZDc0x6WXlZQy9FY2JJOUxiRFNyaU9vTnNEY0xZRFBMSkRi?=
 =?utf-8?B?WE1qdlpJZnpGQ3F1VDF4d1doNUZiU3VBWFRrUDk3NFVpdmY4Z1F2ZWE2Q0Jh?=
 =?utf-8?B?UjV3aEJFUHptMW1sbzhQbWE0Y1dOWVJETXBQTjRuSktGMlM3Zmg5b1ZxN2Vp?=
 =?utf-8?B?S0dUeVhBU05ydnlzckpZU29mVlgyL293ODM1RlltOG4wRmNaYU5LZVZDMjg1?=
 =?utf-8?B?eG1WNGdaREoxODdNWVYwOTRIdnZNbzRDS0VyeUlRcVBSalVSLzdZc3RoSUhM?=
 =?utf-8?B?MXJQTjJuRFNhN2M3bUd4Q1VORFVBa0U2WXIzTnlzUCs2TFliUXpwTGVqTlBJ?=
 =?utf-8?B?NEQ0R2gyV2NuOUxBL0VCSk9qUW1MaStHWWZrYXg1QzVmTDZ2QThTVTE1SUdM?=
 =?utf-8?B?RlozY1lGZjAraGtFcXhici80bDJrejhkVHA1RXlmeEFkT2lFeXZBUUtTRGJV?=
 =?utf-8?B?SnI0UXJxMHJWS2RSWkc0dTBLMkljZzdyN243cVZZK3QwaVRFc21oNEFNVGhS?=
 =?utf-8?B?ZGw5Y3VRRTRjYTdNc3JIZ3htTWIyT3B2MWV3NjJGQ0xuSU9hYjVYbHlHT3dS?=
 =?utf-8?Q?jI8xCWUhBEyZCy29Covs4PgRXgkySWvFJYxFwFk?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7109d883-05fc-4675-9e90-08d916e5372d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:33:18.2925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKjeUeyiMlgo2JhHQgr3lDFlJEET+CG3r0AoqOPkYfTmA+AeG2aZnW0/eh6oyj2W19KV0mtXODgteGzsdVSxKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7810
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=761afde0a=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Fri, 14 May 2021 14:33:27 -0000

We implement various AIA local interrupt CSRs for M-mode, HS-mode,
and VS-mode.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c        |   27 +-
 target/riscv/cpu.h        |   52 +-
 target/riscv/cpu_helper.c |  245 ++++++++-
 target/riscv/csr.c        | 1059 +++++++++++++++++++++++++++++++++++--
 target/riscv/machine.c    |   26 +-
 5 files changed, 1309 insertions(+), 100 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f3702111ae..795162834b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -256,11 +256,11 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
                      (target_ulong)env->vsstatus);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
+    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mip     ", env->mip);
+    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mie     ", env->mie);
+    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mideleg ", env->mideleg);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
+        qemu_fprintf(f, " %s %016" PRIx64 "\n", "hideleg ", env->hideleg);
     }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
     if (riscv_has_ext(env, RVH)) {
@@ -345,6 +345,8 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
 
 static void riscv_cpu_reset(DeviceState *dev)
 {
+    uint8_t iprio;
+    int i, irq, rdzero;
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
@@ -357,6 +359,23 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mcause = 0;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
+
+    /* Initialized default priorities of local interrupts. */
+    for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
+        iprio = riscv_cpu_default_priority(i);
+        env->miprio[i] = iprio;
+        env->siprio[i] = iprio;
+        env->hviprio[i] = IPRIO_DEFAULT_MMAXIPRIO;
+    }
+    i = 0;
+    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
+        if (rdzero) {
+            env->hviprio[irq] = 0;
+        } else {
+            env->hviprio[irq] = env->miprio[irq];
+        }
+        i++;
+    }
 #endif
     cs->exception_index = EXCP_NONE;
     env->load_res = -1;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f00c60c840..780d3f9058 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -157,12 +157,12 @@ struct CPURISCVState {
      */
     uint64_t mstatus;
 
-    target_ulong mip;
+    uint64_t mip;
 
-    uint32_t miclaim;
+    uint64_t miclaim;
 
-    target_ulong mie;
-    target_ulong mideleg;
+    uint64_t mie;
+    uint64_t mideleg;
 
     target_ulong sptbr;  /* until: priv-1.9.1 */
     target_ulong satp;   /* since: priv-1.10.0 */
@@ -179,16 +179,27 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    /* AIA CSRs */
+    target_ulong miselect;
+    target_ulong siselect;
+
+    uint8_t miprio[64];
+    uint8_t siprio[64];
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
-    target_ulong hideleg;
+    uint64_t hideleg;
     target_ulong hcounteren;
     target_ulong htval;
     target_ulong htinst;
     target_ulong hgatp;
     uint64_t htimedelta;
 
+    /* AIA HS-mode CSRs */
+    uint8_t hviprio[64];
+    target_ulong hvicontrol;
+
     /* Virtual CSRs */
     /*
      * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
@@ -202,6 +213,9 @@ struct CPURISCVState {
     target_ulong vstval;
     target_ulong vsatp;
 
+    /* AIA VS-mode CSRs */
+    target_ulong vsiselect;
+
     target_ulong mtval2;
     target_ulong mtinst;
 
@@ -236,6 +250,18 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
 
+    /* machine specific AIA IMSIC read-modify-write callback */
+#define IMSIC_MAKE_REG(__isel, __priv, __virt, __vgein) \
+    ((((__vgein) & 0x3f) << 24) | (((__virt) & 0x1) << 20) | \
+     (((__priv) & 0x3) << 16) | (__isel & 0xffff))
+#define IMSIC_REG_ISEL(__reg)                  ((__reg) & 0xffff)
+#define IMSIC_REG_PRIV(__reg)                  (((__reg) >> 16) & 0x3)
+#define IMSIC_REG_VIRT(__reg)                  (((__reg) >> 20) & 0x1)
+#define IMSIC_REG_VGEIN(__reg)                 (((__reg) >> 24) & 0x3f)
+    int (*imsic_rmw_fn)(void *arg, target_ulong reg, target_ulong *val,
+                        target_ulong new_val, target_ulong write_mask);
+    void *imsic_rmw_fn_arg;
+
     /* True if in debugger mode.  */
     bool debugger;
 #endif
@@ -335,6 +361,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
+uint8_t riscv_cpu_default_priority(int irq);
+int riscv_cpu_mirq_pending(CPURISCVState *env);
+int riscv_cpu_sirq_pending(CPURISCVState *env);
+int riscv_cpu_vsirq_pending(CPURISCVState *env);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
@@ -364,9 +395,16 @@ void riscv_cpu_list(void);
 
 #ifndef CONFIG_USER_ONLY
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
-uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
+uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
+void riscv_cpu_set_imsic_rmw_fn(CPURISCVState *env,
+                                int (*rmw_fn)(void *arg,
+                                              target_ulong reg,
+                                              target_ulong *val,
+                                              target_ulong new_val,
+                                              target_ulong write_mask),
+                                void *rmw_fn_arg);
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..5b06b4f995 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -36,44 +36,219 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 }
 
 #ifndef CONFIG_USER_ONLY
-static int riscv_cpu_local_irq_pending(CPURISCVState *env)
+
+/*
+ * The HS-mode is allowed to configure priority only for the
+ * following VS-mode local interrupts:
+ *
+ * 0  (Reserved interrupt, reads as zero)
+ * 1  Supervisor software interrupt
+ * 4  (Reserved interrupt, reads as zero)
+ * 5  Supervisor timer interrupt
+ * 8  (Reserved interrupt, reads as zero)
+ * 13 (Reserved interrupt)
+ * 14 "
+ * 15 "
+ * 16 "
+ * 18 Debug/trace interrupt
+ * 20 (Reserved interrupt)
+ * 22 ”
+ * 24 ”
+ * 26 ”
+ * 28 "
+ * 30 (Reserved for standard reporting of bus or system errors)
+ */
+
+static int hviprio_index2irq[] =
+    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
+static int hviprio_index2rdzero[] =
+    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
+
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero)
 {
-    target_ulong irqs;
+    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <= index) {
+        return -EINVAL;
+    }
 
-    target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
-    target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
-    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
+    if (out_irq) {
+        *out_irq = hviprio_index2irq[index];
+    }
+
+    if (out_rdzero) {
+        *out_rdzero = hviprio_index2rdzero[index];
+    }
 
-    target_ulong pending = env->mip & env->mie &
-                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-    target_ulong vspending = (env->mip & env->mie &
-                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
+    return 0;
+}
 
-    target_ulong mie    = env->priv < PRV_M ||
-                          (env->priv == PRV_M && mstatus_mie);
-    target_ulong sie    = env->priv < PRV_S ||
-                          (env->priv == PRV_S && mstatus_sie);
-    target_ulong hs_sie = env->priv < PRV_S ||
-                          (env->priv == PRV_S && hs_mstatus_sie);
+uint8_t riscv_cpu_default_priority(int irq)
+{
+    int u, l;
+    uint8_t iprio = IPRIO_MMAXIPRIO;
 
-    if (riscv_cpu_virt_enabled(env)) {
-        target_ulong pending_hs_irq = pending & -hs_sie;
+    if (irq < 0 || irq > 63) {
+        return iprio;
+    }
 
-        if (pending_hs_irq) {
-            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
-            return ctz64(pending_hs_irq);
+    /*
+     * Default priorities of local interrupts are defined in the
+     * RISC-V Advanced Interrupt Architecture specification.
+     *
+     * ----------------------------------------------------------------
+     *  Default  |
+     *  Priority | Major Interrupt Numbers
+     * ----------------------------------------------------------------
+     *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),
+     *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),
+     *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),
+     *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
+     *           |
+     *           | 11 (0b),  3 (03),  7 (07)
+     *           |  9 (09),  1 (01),  5 (05)
+     *           | 12 (0c)
+     *           | 10 (0a),  2 (02),  6 (06)
+     *           |
+     *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),
+     *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),
+     *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),
+     *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
+     * ----------------------------------------------------------------
+     */
+
+    u = IPRIO_DEFAULT_U(irq);
+    l = IPRIO_DEFAULT_L(irq);
+    if (u == 0) {
+        if (irq == IRQ_VS_EXT || irq == IRQ_VS_TIMER ||
+            irq == IRQ_VS_SOFT) {
+            iprio = IPRIO_DEFAULT_VS;
+        } else if (irq == IRQ_S_GEXT) {
+            iprio = IPRIO_DEFAULT_SGEXT;
+        } else if (irq == IRQ_S_EXT || irq == IRQ_S_TIMER ||
+                   irq == IRQ_S_SOFT) {
+            iprio = IPRIO_DEFAULT_S;
+        } else if (irq == IRQ_M_EXT || irq == IRQ_M_TIMER ||
+                   irq == IRQ_M_SOFT) {
+            iprio = IPRIO_DEFAULT_M;
+        } else {
+            iprio = IPRIO_DEFAULT_VS;
         }
+    } else if (u == 1) {
+        if (l < 8) {
+            iprio = IPRIO_DEFAULT_16_23(irq);
+        } else {
+            iprio = IPRIO_DEFAULT_24_31(irq);
+        }
+    } else if (u == 2) {
+        iprio = IPRIO_DEFAULT_32_47(irq);
+    } else if (u == 3) {
+        iprio = IPRIO_DEFAULT_48_63(irq);
+    }
+
+    return iprio;
+}
+
+static int riscv_cpu_pending_to_irq(CPURISCVState *env,
+                                    uint64_t pending, uint8_t *iprio)
+{
+    int irq, best_irq = EXCP_NONE;
+    unsigned int prio, best_prio = UINT_MAX;
 
-        pending = vspending;
+    if (!pending) {
+        return EXCP_NONE;
     }
 
-    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
+    irq = ctz64(pending);
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return irq;
+    }
 
-    if (irqs) {
-        return ctz64(irqs); /* since non-zero */
+    pending = pending >> irq;
+    while (pending) {
+        prio = iprio[irq];
+        if (!prio) {
+            prio = (riscv_cpu_default_priority(irq) < IPRIO_DEFAULT_M) ?
+                   1 : IPRIO_MMAXIPRIO;
+        }
+        if ((pending & 0x1) && (prio < best_prio)) {
+            best_irq = irq;
+            best_prio = prio;
+        }
+        irq++;
+        pending = pending >> 1;
+    }
+
+    return best_irq;
+}
+
+int riscv_cpu_mirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = env->mip & env->mie & ~env->mideleg &
+                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
+}
+
+int riscv_cpu_sirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = env->mip & env->mie & env->mideleg &
+                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
+}
+
+int riscv_cpu_vsirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = env->mip & env->mie & env->mideleg &
+                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
+}
+
+static int riscv_cpu_local_irq_pending(CPURISCVState *env)
+{
+    int virq;
+    uint64_t irqs, mie, sie, vsie;
+    uint64_t pending, vspending;
+
+    /* Determine interrupt enable state of all privilege modes */
+    if (riscv_cpu_virt_enabled(env)) {
+        mie = 1;
+        sie = 1;
+        vsie = (env->priv < PRV_S) ||
+               (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_SIE));
     } else {
-        return EXCP_NONE; /* indicates no pending interrupt */
+        mie = (env->priv < PRV_M) ||
+              (env->priv == PRV_M && get_field(env->mstatus, MSTATUS_MIE));
+        sie = (env->priv < PRV_S) ||
+              (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_SIE));
+        vsie = 0;
+    }
+
+    /* Check M-mode interrupts */
+    pending = env->mip & env->mie &
+              ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+    irqs = pending & ~env->mideleg & -mie;
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
+    }
+
+    /* Check HS-mode interrupts */
+    irqs = pending & env->mideleg & -sie;
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
+    }
+
+    /* Check VS-mode interrupts */
+    vspending = env->mip & env->mie &
+                (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+    irqs = vspending & env->hideleg & -vsie;
+    if (irqs) {
+        virq = riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
+        return (virq <= 0) ? virq : virq + 1;
     }
+
+    /* Indicates no pending interrupt */
+    return EXCP_NONE;
 }
 #endif
 
@@ -213,7 +388,7 @@ bool riscv_cpu_two_stage_lookup(int mmu_idx)
     return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 }
 
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
     if (env->miclaim & interrupts) {
@@ -224,11 +399,11 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
     }
 }
 
-uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
+uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 {
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    uint32_t old = env->mip;
+    uint64_t old = env->mip;
     bool locked = false;
 
     if (!qemu_mutex_iothread_locked()) {
@@ -251,6 +426,18 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
     return old;
 }
 
+void riscv_cpu_set_imsic_rmw_fn(CPURISCVState *env,
+                                int (*rmw_fn)(void *arg,
+                                              target_ulong reg,
+                                              target_ulong *val,
+                                              target_ulong new_val,
+                                              target_ulong write_mask),
+                                void *rmw_fn_arg)
+{
+    env->imsic_rmw_fn = rmw_fn;
+    env->imsic_rmw_fn_arg = rmw_fn_arg;
+}
+
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg)
 {
@@ -904,7 +1091,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      */
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
-    target_ulong deleg = async ? env->mideleg : env->medeleg;
+    uint64_t deleg = async ? env->mideleg : env->medeleg;
     bool write_tval = false;
     target_ulong tval = 0;
     target_ulong htval = 0;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bf..3c016d7452 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -153,11 +153,56 @@ static int any32(CPURISCVState *env, int csrno)
 
 }
 
+static int aia_any(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+}
+
+static int aia_any32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any32(env, csrno);
+}
+
 static int smode(CPURISCVState *env, int csrno)
 {
     return -!riscv_has_ext(env, RVS);
 }
 
+static int smode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
+static int aia_smode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
+static int aia_smode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode32(env, csrno);
+}
+
 static int hmode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVS) &&
@@ -177,11 +222,28 @@ static int hmode(CPURISCVState *env, int csrno)
 static int hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return 0;
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return hmode(env, csrno);
+}
+
+static int aia_hmode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
     }
 
     return hmode(env, csrno);
+}
 
+static int aia_hmode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return hmode32(env, csrno);
 }
 
 static int pmp(CPURISCVState *env, int csrno)
@@ -388,14 +450,16 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 
 /* Machine constants */
 
-#define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
-#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
-#define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
+#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
+#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
+#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
+
+#define TLOWBITS64         ((uint64_t)((target_ulong)-1))
 
-static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
-                                           VS_MODE_INTERRUPTS;
-static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
-                                     VS_MODE_INTERRUPTS;
+static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
+                                       VS_MODE_INTERRUPTS;
+static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
+                                 VS_MODE_INTERRUPTS;
 static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_INST_ADDR_MIS)) |
     (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) |
@@ -419,10 +483,10 @@ static const target_ulong delegable_excps =
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
-static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
-static const target_ulong hip_writable_mask = MIP_VSSIP;
-static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
-static const target_ulong vsip_writable_mask = MIP_VSSIP;
+static const uint64_t sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
+static const uint64_t hip_writable_mask = MIP_VSSIP;
+static const uint64_t hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
+static const uint64_t vsip_writable_mask = MIP_VSSIP;
 
 static const char valid_vm_1_10_32[16] = {
     [VM_1_10_MBARE] = 1,
@@ -596,7 +660,437 @@ static int read_mideleg(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_mideleg(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
+    uint64_t mask = delegable_ints & TLOWBITS64;
+
+    env->mideleg = (env->mideleg & ~mask) | (val & mask);
+    if (riscv_has_ext(env, RVH)) {
+        env->mideleg |= VS_MODE_INTERRUPTS;
+    }
+    return 0;
+}
+
+static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_virt_enabled(env)) {
+        return csrno;
+    }
+
+    switch (csrno) {
+    case CSR_SISELECT:
+        return CSR_VSISELECT;
+    case CSR_SIREG:
+        return CSR_VSIREG;
+    case CSR_STOPI:
+        return CSR_VSTOPI;
+    case CSR_SSETEIPNUM:
+        return CSR_VSSETEIPNUM;
+    case CSR_SCLREIPNUM:
+        return CSR_VSCLREIPNUM;
+    case CSR_SSETEIENUM:
+        return CSR_VSSETEIENUM;
+    case CSR_SCLREIENUM:
+        return CSR_VSCLREIENUM;
+    default:
+        return csrno;
+    };
+}
+
+static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
+                        target_ulong new_val, target_ulong write_mask)
+{
+    target_ulong *iselect;
+
+    switch (csrno) {
+    case CSR_MISELECT:
+        iselect = &env->miselect;
+        break;
+    case CSR_SISELECT:
+        iselect = riscv_cpu_virt_enabled(env) ?
+                  &env->vsiselect : &env->siselect;
+        break;
+    case CSR_VSISELECT:
+        iselect = &env->vsiselect;
+        break;
+    default:
+         return -RISCV_EXCP_ILLEGAL_INST;
+    };
+
+    if (val) {
+        *val = *iselect;
+    }
+
+    if (write_mask) {
+        *iselect = (*iselect & ~write_mask) | (new_val & write_mask);
+    }
+
+    return 0;
+}
+
+static int rmw_iprio(target_ulong iselect, uint8_t *iprio,
+                     target_ulong *val, target_ulong new_val,
+                     target_ulong write_mask)
+{
+    int i, firq, nirqs;
+    target_ulong old_val;
+
+    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
+        return -EINVAL;
+    }
+#if TARGET_LONG_BITS == 64
+    if (iselect & 0x1) {
+        return -EINVAL;
+    }
+#endif
+
+    nirqs = 4 * (TARGET_LONG_BITS / 32);
+    firq = ((iselect - ISELECT_IPRIO0) / (TARGET_LONG_BITS / 32)) * (nirqs);
+
+    old_val = 0;
+    for (i = 0; i < nirqs; i++) {
+        old_val |= ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BITS * i);
+    }
+
+    if (val) {
+        *val = old_val;
+    }
+
+    if (write_mask) {
+        new_val = (old_val & ~write_mask) | (new_val & write_mask);
+        for (i = 0; i < nirqs; i++) {
+            iprio[firq + i] = (new_val >> (IPRIO_IRQ_BITS * i)) & 0xff;
+        }
+    }
+
+    return 0;
+}
+
+static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
+                     target_ulong new_val, target_ulong write_mask)
+{
+    bool virt;
+    uint8_t *iprio;
+    int ret = -EINVAL;
+    target_ulong priv, isel, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MIREG:
+        iprio = env->miprio;
+        isel = env->miselect;
+        priv = PRV_M;
+        break;
+    case CSR_SIREG:
+        iprio = env->siprio;
+        isel = env->siselect;
+        priv = PRV_S;
+        break;
+    case CSR_VSIREG:
+        iprio = env->hviprio;
+        isel = env->vsiselect;
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? (env->hstatus & HSTATUS_VGEIN) >> HSTATUS_VGEIN_SHIFT : 0;
+
+    if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
+        /* Local interrupt priority registers not available for VS-mode */
+        if (!virt) {
+            ret = rmw_iprio(isel, iprio, val, new_val, write_mask);
+        }
+    } else if (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST) {
+        /* IMSIC registers only available when machine implements it. */
+        if (env->imsic_rmw_fn) {
+            /* Selected guest interrupt file should not be zero */
+            if (virt && !vgein) {
+                goto done;
+            }
+            /* Call machine specific IMSIC register emulation */
+            ret = env->imsic_rmw_fn(env->imsic_rmw_fn_arg,
+                                    IMSIC_MAKE_REG(isel, priv, virt, vgein),
+                                    val, new_val, write_mask);
+        }
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGAL_INST;
+    }
+    return 0;
+}
+
+static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+
+    irq = riscv_cpu_mirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= env->miprio[irq];
+    }
+
+    return 0;
+}
+
+static int read_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    bool virt;
+    int ret = -EINVAL;
+    target_ulong vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MSETEIPNUM:
+    case CSR_MCLREIPNUM:
+    case CSR_MSETEIENUM:
+    case CSR_MCLREIENUM:
+    case CSR_SSETEIPNUM:
+    case CSR_SCLREIPNUM:
+    case CSR_SSETEIENUM:
+    case CSR_SCLREIENUM:
+        break;
+    case CSR_VSSETEIPNUM:
+    case CSR_VSCLREIPNUM:
+    case CSR_VSSETEIENUM:
+    case CSR_VSCLREIENUM:
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* IMSIC CSRs only available when machine implements IMSIC. */
+    if (!env->imsic_rmw_fn) {
+        goto done;
+    }
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? (env->hstatus & HSTATUS_VGEIN) >> HSTATUS_VGEIN_SHIFT : 0;
+
+    /* Selected guest interrupt file should not be zero */
+    if (virt && !vgein) {
+        goto done;
+    }
+
+    /* Set/Clear CSRs always read zero */
+    ret = 0;
+    if (val) {
+        *val = 0;
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGAL_INST;
+    }
+    return 0;
+}
+
+static int write_xsetclreinum(CPURISCVState *env, int csrno, target_ulong val)
+{
+    int ret = -EINVAL;
+    bool set, pend, virt;
+    target_ulong priv, isel, vgein;
+    target_ulong new_val, write_mask;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = set = pend = false;
+    switch (csrno) {
+    case CSR_MSETEIPNUM:
+        priv = PRV_M;
+        set = true;
+        break;
+    case CSR_MCLREIPNUM:
+        priv = PRV_M;
+        pend = true;
+        break;
+    case CSR_MSETEIENUM:
+        priv = PRV_M;
+        set = true;
+        break;
+    case CSR_MCLREIENUM:
+        priv = PRV_M;
+        break;
+    case CSR_SSETEIPNUM:
+        priv = PRV_S;
+        set = true;
+        pend = true;
+        break;
+    case CSR_SCLREIPNUM:
+        priv = PRV_S;
+        pend = true;
+        break;
+    case CSR_SSETEIENUM:
+        priv = PRV_S;
+        set = true;
+        break;
+    case CSR_SCLREIENUM:
+        priv = PRV_S;
+        break;
+    case CSR_VSSETEIPNUM:
+        priv = PRV_S;
+        virt = true;
+        set = true;
+        pend = true;
+        break;
+    case CSR_VSCLREIPNUM:
+        priv = PRV_S;
+        virt = true;
+        pend = true;
+        break;
+    case CSR_VSSETEIENUM:
+        priv = PRV_S;
+        virt = true;
+        set = true;
+        break;
+    case CSR_VSCLREIENUM:
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* IMSIC CSRs only available when machine implements IMSIC. */
+    if (!env->imsic_rmw_fn) {
+        goto done;
+    }
+
+    /* Find target interrupt pending/enable register */
+    if (pend) {
+        isel = ISELECT_IMSIC_EIP0;
+    } else {
+        isel = ISELECT_IMSIC_EIE0;
+    }
+    isel += val / IMSIC_EIPx_BITS;
+
+    /* Find the interrupt bit to be set/clear */
+    write_mask = 1 << (val % IMSIC_EIPx_BITS);
+    new_val = (set) ? write_mask : 0;
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? (env->hstatus & HSTATUS_VGEIN) >> HSTATUS_VGEIN_SHIFT : 0;
+
+    /* Selected guest interrupt file should not be zero */
+    if (virt && !vgein) {
+        goto done;
+    }
+
+    /* Call machine specific IMSIC register emulation */
+    ret = env->imsic_rmw_fn(env->imsic_rmw_fn_arg,
+                            IMSIC_MAKE_REG(isel, priv, virt, vgein),
+                            NULL, new_val, write_mask);
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGAL_INST;
+    }
+    return 0;
+}
+
+static int read_xclaimei(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    bool virt;
+    int ret = -EINVAL;
+    target_ulong priv, isel, vgein;
+    target_ulong topei, write_mask;
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MCLAIMEI:
+        priv = PRV_M;
+        break;
+    case CSR_SCLAIMEI:
+        priv = PRV_S;
+        virt = riscv_cpu_virt_enabled(env);
+        break;
+    default:
+        goto done;
+    };
+
+    /* IMSIC CSRs only available when machine implements IMSIC. */
+    if (!env->imsic_rmw_fn) {
+        goto done;
+    }
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? (env->hstatus & HSTATUS_VGEIN) >> HSTATUS_VGEIN_SHIFT : 0;
+
+    /* Selected guest interrupt file should not be zero */
+    if (virt && !vgein) {
+        goto done;
+    }
+
+    /* Call machine specific IMSIC register emulation for reading TOPEI */
+    ret = env->imsic_rmw_fn(env->imsic_rmw_fn_arg,
+                            IMSIC_MAKE_REG(ISELECT_IMSIC_TOPEI, priv, virt, vgein),
+                            &topei, -1, 0);
+    if (ret) {
+        goto done;
+    }
+
+    /* If no interrupt pending then we are done */
+    if (!topei) {
+        goto done;
+    }
+
+    /* Find target interrupt pending register */
+    isel = ISELECT_IMSIC_EIP0;
+    isel += ((topei >> TOPI_IID_SHIFT) / IMSIC_EIPx_BITS);
+
+    /* Find the interrupt bit to be cleared */
+    write_mask = 1 << ((topei >> TOPI_IID_SHIFT) % IMSIC_EIPx_BITS);
+
+    /* Call machine specific IMSIC register emulation to clear pending bit */
+    ret = env->imsic_rmw_fn(env->imsic_rmw_fn_arg,
+                            IMSIC_MAKE_REG(isel, priv, virt, vgein),
+                            NULL, 0, write_mask);
+
+    /* Update return value */
+    if (val) {
+        *val = topei;
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGAL_INST;
+    }
+    return 0;
+}
+
+static int read_midelegh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = (env->mideleg >> 32);
+    return 0;
+}
+
+static int write_midelegh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    uint64_t mask = delegable_ints & ~TLOWBITS64;
+    uint64_t newval = ((uint64_t)val) << 32;
+
+    env->mideleg = (env->mideleg & ~mask) | (newval & mask);
     if (riscv_has_ext(env, RVH)) {
         env->mideleg |= VS_MODE_INTERRUPTS;
     }
@@ -611,7 +1105,24 @@ static int read_mie(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_mie(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    uint64_t mask = all_ints & TLOWBITS64;
+
+    env->mie = (env->mie & ~mask) | (val & mask);
+    return 0;
+}
+
+static int read_mieh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = (env->mie >> 32);
+    return 0;
+}
+
+static int write_mieh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    uint64_t mask = all_ints & ~TLOWBITS64;
+    uint64_t newval = ((uint64_t)val) << 32;
+
+    env->mie = (env->mie & ~mask) | (newval & mask);
     return 0;
 }
 
@@ -718,8 +1229,9 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
 {
     RISCVCPU *cpu = env_archcpu(env);
     /* Allow software control of delegable interrupts not claimed by hardware */
-    target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
-    uint32_t old_mip;
+    uint64_t mask = ((uint64_t)write_mask) & delegable_ints &
+                    ~env->miclaim & TLOWBITS64;
+    uint64_t old_mip;
 
     if (mask) {
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
@@ -734,6 +1246,29 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return 0;
 }
 
+static int rmw_miph(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                    target_ulong new_value, target_ulong write_mask)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    /* Allow software control of delegable interrupts not claimed by hardware */
+    uint64_t mask = ((uint64_t)write_mask << 32) & delegable_ints &
+                    ~env->miclaim & ~TLOWBITS64;
+    uint64_t new_value64 = (uint64_t)new_value << 32;
+    uint64_t old_mip;
+
+    if (mask) {
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value64 & mask));
+    } else {
+        old_mip = env->mip;
+    }
+
+    if (ret_value) {
+        *ret_value = old_mip >> 32;
+    }
+
+    return 0;
+}
+
 /* Supervisor Trap Setup */
 static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -751,39 +1286,103 @@ static int write_sstatus(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
 {
+    uint64_t mask = VS_MODE_INTERRUPTS & env->hideleg & TLOWBITS64;
+
     /* Shift the VS bits to their S bit location in vsie */
-    *val = (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
+    *val = (env->mie & mask) >> 1;
+    return 0;
+}
+
+static int read_vsieh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    uint64_t mask = VS_MODE_INTERRUPTS & env->hideleg & ~TLOWBITS64;
+
+    /* Shift the VS bits to their S bit location in vsieh */
+    *val = (env->mie & mask) >> (32 + 1);
     return 0;
 }
 
 static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
 {
     if (riscv_cpu_virt_enabled(env)) {
-        read_vsie(env, CSR_VSIE, val);
-    } else {
-        *val = env->mie & env->mideleg;
+        if (env->hvicontrol & HVICONTROL_VTI) {
+            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        return read_vsie(env, CSR_VSIE, val);
     }
+
+    *val = env->mie & env->mideleg;
     return 0;
 }
 
 static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
 {
+    uint64_t mask = VS_MODE_INTERRUPTS & env->hideleg &
+                    all_ints & TLOWBITS64;
+
     /* Shift the S bits to their VS bit location in mie */
-    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
-                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPTS);
-    return write_mie(env, CSR_MIE, newval);
+    env->mie = (env->mie & ~mask) | ((val << 1) & mask);
+
+    return 0;
+}
+
+static int write_vsieh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    uint64_t mask = VS_MODE_INTERRUPTS & env->hideleg &
+                    all_ints & ~TLOWBITS64;
+    uint64_t newval = (uint64_t)val << 32;
+
+    /* Shift the S bits to their VS bit location in mie */
+    env->mie = (env->mie & ~mask) | ((newval << 1) & mask);
+
+    return 0;
 }
 
 static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
 {
+    uint64_t mask;
+
     if (riscv_cpu_virt_enabled(env)) {
-        write_vsie(env, CSR_VSIE, val);
-    } else {
-        target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
-                              (val & S_MODE_INTERRUPTS);
-        write_mie(env, CSR_MIE, newval);
+        if (env->hvicontrol & HVICONTROL_VTI) {
+            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        return write_vsie(env, CSR_VSIE, val);
+    }
+
+    mask = S_MODE_INTERRUPTS & env->mideleg & all_ints & TLOWBITS64;
+    env->mie = (env->mie & ~mask) | ((uint64_t)val & mask);
+
+    return 0;
+}
+
+static int read_sieh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvicontrol & HVICONTROL_VTI) {
+            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        return read_vsieh(env, CSR_VSIEH, val);
+    }
+
+    *val = ((env->mie & env->mideleg) >> 32);
+    return 0;
+}
+
+static int write_sieh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    uint64_t mask, newval;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvicontrol & HVICONTROL_VTI) {
+            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        return write_vsieh(env, CSR_VSIEH, val);
     }
 
+    mask = S_MODE_INTERRUPTS & env->mideleg & all_ints & ~TLOWBITS64;
+    newval = (uint64_t)val << 32;
+
+    env->mie = (env->mie & ~mask) | (newval & mask);
     return 0;
 }
 
@@ -868,29 +1467,110 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
 static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                     target_ulong new_value, target_ulong write_mask)
 {
-    /* Shift the S bits to their VS bit location in mip */
-    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
-                      (write_mask << 1) & vsip_writable_mask & env->hideleg);
-    *ret_value &= VS_MODE_INTERRUPTS;
-    /* Shift the VS bits to their S bit location in vsip */
-    *ret_value >>= 1;
-    return ret;
+    RISCVCPU *cpu = env_archcpu(env);
+    /* Allow software control of delegable interrupts not claimed by hardware */
+    uint64_t mask = ((uint64_t)write_mask << 1) & delegable_ints &
+                    vsip_writable_mask & env->hideleg &
+                    ~env->miclaim & TLOWBITS64;
+    uint64_t old_mip;
+
+    if (mask) {
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
+    } else {
+        old_mip = env->mip;
+    }
+
+    if (ret_value) {
+        *ret_value = old_mip & VS_MODE_INTERRUPTS;
+    }
+
+    return 0;
+}
+
+static int rmw_vsiph(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                     target_ulong new_value, target_ulong write_mask)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    /* Allow software control of delegable interrupts not claimed by hardware */
+    uint64_t mask = ((uint64_t)write_mask << (32 + 1)) & delegable_ints &
+                    vsip_writable_mask & env->hideleg &
+                    ~env->miclaim & ~TLOWBITS64;
+    uint64_t new_value64 = (uint64_t)new_value << 32;
+    uint64_t old_mip;
+
+    if (mask) {
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value64 & mask));
+    } else {
+        old_mip = env->mip;
+    }
+
+    if (ret_value) {
+        *ret_value = (old_mip & VS_MODE_INTERRUPTS) >> 32;
+    }
+
+    return 0;
 }
 
 static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
-    int ret;
+    RISCVCPU *cpu = env_archcpu(env);
+    uint64_t mask, old_mip;
 
     if (riscv_cpu_virt_enabled(env)) {
-        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
+        if (env->hvicontrol & HVICONTROL_VTI) {
+            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        return rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
+    }
+
+    /* Allow software control of delegable interrupts not claimed by hardware */
+    mask = ((uint64_t)write_mask) & delegable_ints &
+           env->mideleg & sip_writable_mask &
+           ~env->miclaim & TLOWBITS64;
+    if (mask) {
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
     } else {
-        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
-                      write_mask & env->mideleg & sip_writable_mask);
+        old_mip = env->mip;
     }
 
-    *ret_value &= env->mideleg;
-    return ret;
+    if (ret_value) {
+        *ret_value = old_mip;
+    }
+
+    return 0;
+}
+
+static int rmw_siph(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                    target_ulong new_value, target_ulong write_mask)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    uint64_t mask, new_value64;
+    uint64_t old_mip;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvicontrol & HVICONTROL_VTI) {
+            return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        return rmw_vsiph(env, CSR_VSIPH, ret_value, new_value, write_mask);
+    }
+
+    /* Allow software control of delegable interrupts not claimed by hardware */
+    mask = ((uint64_t)write_mask << 32) & delegable_ints &
+           env->mideleg & sip_writable_mask &
+           ~env->miclaim & ~TLOWBITS64;
+    new_value64 = (uint64_t)new_value << 32;
+    if (mask) {
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value64 & mask));
+    } else {
+        old_mip = env->mip;
+    }
+
+    if (ret_value) {
+        *ret_value = (old_mip & env->mideleg) >> 32;
+    }
+
+    return 0;
 }
 
 /* Supervisor Protection and Translation */
@@ -930,6 +1610,51 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq, hiid;
+    uint8_t hiprio, iprio;
+
+    irq = riscv_cpu_vsirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       iprio = env->hviprio[irq];
+       /* TODO: This needs to improve in specification */
+       if (!(env->hstatus & HSTATUS_VGEIN)) {
+           hiid = (env->hvicontrol & HVICONTROL_IID_MASK) >>
+                 HVICONTROL_IID_SHIFT;
+           hiprio = env->hvicontrol & HVICONTROL_IPRIO_MASK;
+           if (irq == hiid && hiprio) {
+               iprio = hiprio;
+           }
+       }
+       *val |= iprio;
+    }
+
+    return 0;
+}
+
+static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        return read_vstopi(env, CSR_VSTOPI, val);
+    }
+
+    irq = riscv_cpu_sirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= env->siprio[irq];
+    }
+
+    return 0;
+}
+
 /* Hypervisor Extensions */
 static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -979,26 +1704,90 @@ static int write_hideleg(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_hidelegh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->hideleg >> 32;
+    return 0;
+}
+
+static int write_hidelegh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    uint64_t mask = ~TLOWBITS64;
+    uint64_t newval = ((uint64_t)val) << 32;
+
+    env->hideleg = (env->hideleg & ~mask) | (newval & mask);
+
+    return 0;
+}
+
 static int rmw_hvip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
-                      write_mask & hvip_writable_mask);
+    RISCVCPU *cpu = env_archcpu(env);
+    /* Allow software control of delegable interrupts not claimed by hardware */
+    uint64_t mask = ((uint64_t)write_mask) & delegable_ints &
+                    hvip_writable_mask &
+                    ~env->miclaim & TLOWBITS64;
+    uint64_t old_mip;
+
+    if (mask) {
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
+    } else {
+        old_mip = env->mip;
+    }
 
-    *ret_value &= hvip_writable_mask;
+    if (ret_value) {
+        *ret_value = old_mip & hvip_writable_mask;
+    }
 
-    return ret;
+    return 0;
+}
+
+static int rmw_hviph(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                    target_ulong new_value, target_ulong write_mask)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    /* Allow software control of delegable interrupts not claimed by hardware */
+    uint64_t mask = ((uint64_t)write_mask << 32) & delegable_ints &
+                    hvip_writable_mask &
+                    ~env->miclaim & ~TLOWBITS64;
+    uint64_t new_value64 = (uint64_t)new_value << 32;
+    uint64_t old_mip;
+
+    if (mask) {
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value64 & mask));
+    } else {
+        old_mip = env->mip;
+    }
+
+    if (ret_value) {
+        *ret_value = (old_mip & hvip_writable_mask) >> 32;
+    }
+
+    return 0;
 }
 
 static int rmw_hip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
-                      write_mask & hip_writable_mask);
+    RISCVCPU *cpu = env_archcpu(env);
+    /* Allow software control of delegable interrupts not claimed by hardware */
+    uint64_t mask = ((uint64_t)write_mask) & delegable_ints &
+                    hip_writable_mask &
+                    ~env->miclaim & TLOWBITS64;
+    uint64_t old_mip;
 
-    *ret_value &= hip_writable_mask;
+    if (mask) {
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
+    } else {
+        old_mip = env->mip;
+    }
 
-    return ret;
+    if (ret_value) {
+        *ret_value = old_mip & hip_writable_mask;
+    }
+
+    return 0;
 }
 
 static int read_hie(CPURISCVState *env, int csrno, target_ulong *val)
@@ -1009,8 +1798,9 @@ static int read_hie(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_hie(CPURISCVState *env, int csrno, target_ulong val)
 {
-    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS_MODE_INTERRUPTS);
-    return write_mie(env, CSR_MIE, newval);
+    uint64_t mask = VS_MODE_INTERRUPTS & all_ints & TLOWBITS64;
+    env->mie = (env->mie & ~mask) | ((uint64_t)val & mask);
+    return 0;
 }
 
 static int read_hcounteren(CPURISCVState *env, int csrno, target_ulong *val)
@@ -1128,6 +1918,110 @@ static int write_htimedeltah(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_hvicontrol(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->hvicontrol;
+    return 0;
+}
+
+static int write_hvicontrol(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->hvicontrol = val & HVICONTROL_VALID_MASK;
+    return 0;
+}
+
+static int read_hvipriox(CPURISCVState *env, int first_index,
+                         uint8_t *iprio, target_ulong *val)
+{
+    int i, irq, rdzero, num_irqs = 4 * (TARGET_LONG_BITS / 32);
+
+    /* First index has to be multiple of numbe of irqs per register */
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* Fill-up return value */
+    *val = 0;
+    for (i = 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
+            continue;
+        }
+        if (rdzero) {
+            continue;
+        }
+        *val |= ((target_ulong)iprio[irq]) << (i * 8);
+    }
+
+    return 0;
+}
+
+static int write_hvipriox(CPURISCVState *env, int first_index,
+                          uint8_t *iprio, target_ulong val)
+{
+    int i, irq, rdzero, num_irqs = 4 * (TARGET_LONG_BITS / 32);
+
+    /* First index has to be multiple of numbe of irqs per register */
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               -RISCV_EXCP_VIRT_INSTRUCTION_FAULT : -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* Fill-up priority arrary */
+    for (i = 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
+            continue;
+        }
+        if (rdzero) {
+            iprio[irq] = 0;
+        } else {
+            iprio[irq] = (val >> (i * 8)) & 0xff;
+        }
+    }
+
+    return 0;
+}
+
+static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 12, env->hviprio, val);
+}
+
+static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 12, env->hviprio, val);
+}
+
 /* Virtual CSR Registers */
 static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1428,6 +2322,25 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MBADADDR] = { "mbadaddr", any,  read_mbadaddr, write_mbadaddr },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
+    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
+
+    /* Machine-Level Interrupts (AIA) */
+    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
+
+    /* Machine-Level IMSIC Interface (AIA) */
+    [CSR_MSETEIPNUM] = { "mseteipnum", aia_any, read_xsetclreinum, write_xsetclreinum },
+    [CSR_MCLREIPNUM] = { "mclreipnum", aia_any, read_xsetclreinum, write_xsetclreinum },
+    [CSR_MSETEIENUM] = { "mseteienum", aia_any, read_xsetclreinum, write_xsetclreinum },
+    [CSR_MCLREIENUM] = { "mclreienum", aia_any, read_xsetclreinum, write_xsetclreinum },
+    [CSR_MCLAIMEI]   = { "mclaimei",   aia_any, read_xclaimei },
+
+    /* Machine-Level High-Half CSRs (AIA) */
+    [CSR_MIDELEGH] = { "midelegh", aia_any32, read_midelegh, write_midelegh },
+    [CSR_MIEH]     = { "mieh",     aia_any32, read_mieh,     write_mieh     },
+    [CSR_MIPH]     = { "miph",     aia_any32, NULL,    NULL, rmw_miph       },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus    },
     [CSR_SIE]        = { "sie",        smode, read_sie,        write_sie        },
@@ -1444,6 +2357,24 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
+    [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
+
+    /* Supervisor-Level Interrupts (AIA) */
+    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
+
+    /* Supervisor-Level IMSIC Interface (AIA) */
+    [CSR_SSETEIPNUM] = { "sseteipnum", aia_smode, read_xsetclreinum, write_xsetclreinum },
+    [CSR_SCLREIPNUM] = { "sclreipnum", aia_smode, read_xsetclreinum, write_xsetclreinum },
+    [CSR_SSETEIENUM] = { "sseteienum", aia_smode, read_xsetclreinum, write_xsetclreinum },
+    [CSR_SCLREIENUM] = { "sclreienum", aia_smode, read_xsetclreinum, write_xsetclreinum },
+    [CSR_SCLAIMEI]   = { "sclaimei",   aia_smode, read_xclaimei },
+
+    /* Supervisor-Level High-Half CSRs (AIA) */
+    [CSR_SIEH]       = { "sieh",       aia_smode32, read_sieh,  write_sieh },
+    [CSR_SIPH]       = { "siph",       aia_smode32, NULL, NULL, rmw_siph   },
+
     [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,     write_hstatus     },
     [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,     write_hedeleg     },
     [CSR_HIDELEG]     = { "hideleg",     hmode,   read_hideleg,     write_hideleg     },
@@ -1472,6 +2403,32 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
+    /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+    [CSR_HVICONTROL]  = { "hvicontrol",  aia_hmode, read_hvicontrol, write_hvicontrol },
+    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
+    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
+
+    /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
+    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
+
+    /* VS-Level Interrupts (H-extension with AIA) */
+    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
+
+    /* VS-Level IMSIC Interface (H-extension with AIA) */
+    [CSR_VSSETEIPNUM] = { "vsseteipnum", aia_hmode, read_xsetclreinum, write_xsetclreinum },
+    [CSR_VSCLREIPNUM] = { "vsclreipnum", aia_hmode, read_xsetclreinum, write_xsetclreinum },
+    [CSR_VSSETEIENUM] = { "vsseteienum", aia_hmode, read_xsetclreinum, write_xsetclreinum },
+    [CSR_VSCLREIENUM] = { "vsclreienum", aia_hmode, read_xsetclreinum, write_xsetclreinum },
+
+    /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+    [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, read_hidelegh,  write_hidelegh },
+    [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL,     rmw_hviph },
+    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
+    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
+    [CSR_VSIEH]       = { "vsieh",       aia_hmode32, read_vsieh,     write_vsieh },
+    [CSR_VSIPH]       = { "vsiep",       aia_hmode32, NULL, NULL,     rmw_vsiph },
+
     /* Physical Memory Protection */
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 44d4015bd6..f7fa48c240 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -102,19 +102,22 @@ static const VMStateDescription vmstate_vector = {
 
 static const VMStateDescription vmstate_hyper = {
     .name = "cpu/hyper",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = hyper_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(env.hstatus, RISCVCPU),
         VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
-        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
+        VMSTATE_UINT64(env.hideleg, RISCVCPU),
         VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.htval, RISCVCPU),
         VMSTATE_UINTTL(env.htinst, RISCVCPU),
         VMSTATE_UINTTL(env.hgatp, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
 
+        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
+        VMSTATE_UINTTL(env.hvicontrol, RISCVCPU),
+
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
         VMSTATE_UINTTL(env.vstvec, RISCVCPU),
         VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
@@ -122,6 +125,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.vscause, RISCVCPU),
         VMSTATE_UINTTL(env.vstval, RISCVCPU),
         VMSTATE_UINTTL(env.vsatp, RISCVCPU),
+        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
 
         VMSTATE_UINTTL(env.mtval2, RISCVCPU),
         VMSTATE_UINTTL(env.mtinst, RISCVCPU),
@@ -140,11 +144,13 @@ static const VMStateDescription vmstate_hyper = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
+        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
+        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
         VMSTATE_UINTTL(env.pc, RISCVCPU),
         VMSTATE_UINTTL(env.load_res, RISCVCPU),
         VMSTATE_UINTTL(env.load_val, RISCVCPU),
@@ -161,10 +167,10 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.resetvec, RISCVCPU),
         VMSTATE_UINTTL(env.mhartid, RISCVCPU),
         VMSTATE_UINT64(env.mstatus, RISCVCPU),
-        VMSTATE_UINTTL(env.mip, RISCVCPU),
-        VMSTATE_UINT32(env.miclaim, RISCVCPU),
-        VMSTATE_UINTTL(env.mie, RISCVCPU),
-        VMSTATE_UINTTL(env.mideleg, RISCVCPU),
+        VMSTATE_UINT64(env.mip, RISCVCPU),
+        VMSTATE_UINT64(env.miclaim, RISCVCPU),
+        VMSTATE_UINT64(env.mie, RISCVCPU),
+        VMSTATE_UINT64(env.mideleg, RISCVCPU),
         VMSTATE_UINTTL(env.sptbr, RISCVCPU),
         VMSTATE_UINTTL(env.satp, RISCVCPU),
         VMSTATE_UINTTL(env.sbadaddr, RISCVCPU),
@@ -177,6 +183,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mepc, RISCVCPU),
         VMSTATE_UINTTL(env.mcause, RISCVCPU),
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
+        VMSTATE_UINTTL(env.miselect, RISCVCPU),
+        VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
-- 
2.25.1


