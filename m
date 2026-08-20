Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1298DC5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx9Aj-0006nw-3g; Thu, 20 Aug 2026 16:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9Ad-0006JO-Ap
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:15:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AZ-0002dG-LS
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:15:27 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK8ach160944
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=; b=TEYDVI7f33wtkr13
 tqpyv6vR7GvTspu96LWcmHILMOXsMBsmNybvHUQYfwNTKNgMX5IDrcCLCIYWc/qj
 DKgqURiqgLKAEQjsUUJhIUKC34UEyik109nYIsRISvXV16HZLyU2joo6GeMJaXJK
 hJ382WDZHoR/oDIlS3INJg3tuStBGXJ9LOfNJC1tXDiyjE/TbajcHEIWkj2+3DFc
 Fh6+hNKFm05ydl8BFIsK5GY22dcnCnS2LNmmeTVkXlkzNhN9pNA3tPISX3tNNa2p
 4CBAjhuCryh5deKB/3v+wR5RX0ConRefIAj3289Mm6CffDJbAnjBi9PhSRkefLZC
 AGVBGQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk2ycf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-90a3b6281c6so1647096d6.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256912; x=1787861712; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=Iq2eMmwXwJXmRTJK8W80QiXecCGmlkEkkv2tS3PhyfYpDOhD3wCLboDhU4O1nbPusn
 5BlRt7bKP8TnMXIJDJQhu8DNzWoqDtzYTG1DqXrIhcW+xHJyuecH7p41ZhkwYpI9vhFE
 fqXAMTe5jqnVJxSx1KGtsHhVrUahPPvSlvJ5m4/4bbOUSf+kw4iFhZ8Z8Edqn25MkeOZ
 6qTV3ynW/es0qh7AxfaS+Pod9ZfOaDd4WUd4TJSdwfHpCogxOMMguKgHsZGkJ5ijdoxP
 lnKvxPd19nUPLPW4sGoc3GkhWyx8Lh3n7kQxZWGUMEjBZThToZtytkaV2Bkwp9CHdhJy
 0YMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256912; x=1787861712;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J2rUL5dnRfopAxRp6y8OcNqck/aSQMf0xVr1iUn+iFc=;
 b=joCAp7wnhoMRxev3YJTT2BB/bf2vHR2xTnld2DW9DNDXJu0JMZ65viYJafDmL+ZVly
 zrBrLMDnGJei3GgAYa543IJBmQuTvgKH6B8ojkg1lOGWkjiY9aRAP+CehqmNp7EtoxoI
 cObVnzeNXF8LsTmOHiAJMbq7nXtQ8zbqC8218BTHsR3qdwag1+bivwdkpAYZ+NaKc2o/
 T19ad8jWfhQOXSzPmODIj8TqXmlBsE9Z3CcmiL733lVJQExAop3HQnZ1OYA6w34YiMjL
 /CdkP05SDCtpSc7Si6H4FrDEAMadNFa4OiM8WkdX95C25hmIh5YhooWYCUiNqVHd+ZDc
 XkYA==
X-Gm-Message-State: AOJu0YwlqFCK/Ykt/F3RIXw7SoseJWxL0K7xkjiSp8EZ9ZCDDbDag+VI
 GVY4QbAxZk1ykmD6cpGjQ2pRQbmtHqqw197MYy0DJfWyIRGmFGtaxi2pBNwUYzcuIWxEikk5leA
 YdkFAH6E3y2IrVmbEeylGNP9Y70sb2G763iJHQ25rx/AHATjAw+b8Jq5/gQ==
X-Gm-Gg: AR+sD13CGayKBOI3pOlMH7t8OsvqnzbMf8pSRINU9T2816lXAOWhTWcpmYGm56KeHOZ
 ZN57W/xmFsHCmqJqmPDLAK0e/ICvRvnZDOIzc3HR5XPUsKA0ZDELuygaNQeGyG7Hix9kepQH8PY
 AY8HUjtoTEzrEvNuKeFZ6HWQg8wSknaZ7deUYIeHHupwWyEMXnkUwnqAa84NE+YDBCXEsqDFUNi
 CKn4xzf0D3AovmeN5ctqDAlsj6wtM9Z4RRkcKCr6GX4wZ0vOHdtYYRL6UBqRLI2aMDBOe7mKlSK
 odgSIghUDmBJ5YO0+Z1e1GYDH+FEFFbKBCjW542lgkDn59OgnMEyt8X2Fw0LAt2uMGfQhjxIoel
 KBf0qlVD/zDAvhqd2SeKq2MvMvFVpfl5+qJoACQSmqA==
X-Received: by 2002:a05:622a:8a:b0:528:17d9:2d99 with SMTP id
 d75a77b69052e-52df5a748c7mr9238391cf.43.1787256910984; 
 Thu, 20 Aug 2026 13:15:10 -0700 (PDT)
X-Received: by 2002:a05:622a:8a:b0:528:17d9:2d99 with SMTP id
 d75a77b69052e-52df5a748c7mr9237201cf.43.1787256910274; 
 Thu, 20 Aug 2026 13:15:10 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b10fcebdsm15613895f8f.0.2026.08.20.13.15.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v2 09/15] target/riscv: Constify @iprio argument in
 riscv_cpu_pending_to_irq()
Date: Thu, 20 Aug 2026 22:13:49 +0200
Message-ID: <20260820201356.29775-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZI-7oBcLZKRv453rPk6UjNi2JytxLvP0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX4btR/nnreW1l
 azPDpjpnb8E09w13qplMlArB0SH5ZBrvd+4d2HN7Ucex7OGYNUOtKiZM7QqB/7pDewtu2LyjB08
 LavrdI1e6/oyCb26qNgEHBiQf9/cOiY=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a876050 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXz6n9MvxQir0A
 bh2yzrbpZCklDzk+ud1TSdiVLny461QKhMHKLlM4t3Dt5g6MlrDYra5ovzxiO54gCxBGwqB8qYC
 MMLuCaNVxHhI5b+5ax2As+7yHQGrfKDH/10GaSsOzKYB2xkppD2VgDOegLrOTI9MLcWXgxTmmTB
 MZr1JfASuqwjlxbJR81b2HybgPsFjw3LwjRXUrvU2S4pT+aa3jOThUlHdnrJ6B38JrGqaDZ9owr
 h3/thAQVfAOGe0DySpGAchfJIorJVk7/TvMTTaIdiHMd0UNfjHC1AwbrBh0Y3NS+XcSVrEPA5rL
 2V35f5oLRpHBkqMB3tUXlNhPomHrvm1iYYJs4nzO8d/vdkCTRQ5DcQAzjXknyjp4q0JsZdijw15
 /0EOhRUxjbEzAZWuQS9h7Ny4hPW+toOxhdxmP4X4Dn86T/ZdhJPYcenvre53YUZoertJcx+KqNj
 hVpcubm8IIHyx3ZcwKw==
X-Proofpoint-ORIG-GUID: ZI-7oBcLZKRv453rPk6UjNi2JytxLvP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

@iprio[] is an array only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 376cff656fa..bb4c8563554 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -642,7 +642,7 @@ int riscv_cpu_sirq_pending(CPURISCVState *env);
 int riscv_cpu_vsirq_pending(CPURISCVState *env);
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio);
+                             uint64_t pending, const uint8_t *iprio);
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7bf098319f8..858fbf865fd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -866,7 +866,7 @@ uint8_t riscv_cpu_default_priority(int irq)
 
 int riscv_cpu_pending_to_irq(CPURISCVState *env,
                              int extirq, unsigned int extirq_def_prio,
-                             uint64_t pending, uint8_t *iprio)
+                             uint64_t pending, const uint8_t *iprio)
 {
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
-- 
2.53.0


