Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE00606A330
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rw85owdz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IiEaZD0p
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWCwy-0003Qg-Ti; Wed, 25 Nov 2026 08:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCwH-0002pj-DG
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:36 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCwF-0000iU-8a
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:33 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9mHHR4131158
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=oEiv2RKCx/l
 ggwoF70eyDbDMdjCtdf8X8D1On5ijs8c=; b=Rw85owdzF6JS8SwpTwyblO2hv8Z
 6lDHHHfvJYkJgEd6CaBdhnQ+729zvcGSP6k2HZpZs4CwiWDXI5sIT5SvZmRuxaOZ
 BFbt1jIoUK7X/SC36LRu9hdpfaS2qB35JbaAOr/VhdGfpLK/aHqYppMPCj7RHWv/
 A9W2Wb4GDgAWEgdMtRHLQvALbZeotuHCXed1JaH6VeamEER1uWo0/zSK43YcX5QW
 FGYxGymk5/PNbMpZVMQ/sNT9qri54fXTj3MX/hL4V6fhAqBRracM0Bm+ipTARmTk
 W+JbEbJRA6xrVLU7CzUIQd8iXYWii7dIyYgzEhtK09lXksyq4GkZXgNRbjQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhs10a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-9210357af78so97256716d6.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 05:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795612880; x=1796217680; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oEiv2RKCx/lggwoF70eyDbDMdjCtdf8X8D1On5ijs8c=;
 b=IiEaZD0p2BIP3v5j/SBvD/ue7cnNO9uokJwaWFnbb5buMgeLP4rJWCASKBU+nBqgLF
 +NjB81gE4VgWV7y4tsYpJb2vAjZKalacnw7CNzCMaxikYeWWbRkyXn6IPRMH1rS+ZGtl
 DrGx4E+SbYqWucywKC0Hu/3iWpORgRnn7XTz118us78gVEX2zxOkIS3Ghp0yySE2sQ5I
 /fi+a2FOHpGpJynfBdW3VQ1VwKi036LvXE7BsUl+K9lAgwA4msLWDGToeJGx4pPbIRL3
 Hfovvl0TmTvh0xigrPtOdC+5+/osBPiJsFxGkU+TmEb4wMFj0uqjbT7Y5OCBEXiXQJOq
 hYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795612880; x=1796217680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oEiv2RKCx/lggwoF70eyDbDMdjCtdf8X8D1On5ijs8c=;
 b=Ln41cKVUo71H3OFvbM5QscUxBpUvbFulMIPy9dIbpuZZnV/q2PYDzz10FljVzrzcsC
 X6MHrYO03R4s4SoW7CVGurErOjK0oMWrcFDM0w3bk20JX2B2o/uDpzOg95Jvg4EX0wy4
 3I2eRQYrRS1huShm4QbosFqD/ngN8ZbC9E9rkGzJjepTU3LQQwbS3y+sxzN8TqYCOjS0
 8o6PFYztD9qtZwtdb6kkrV7RUu/BD/5Teh/UFI8gJ/x43iSte0uTuOQDszugcV6W7vtb
 Xw+iEFNJvMJrEaEQtaLGoJY3Dez6iA9Tsp1ya5qsSRBoJhYrvQKosG8X9867oo2NYtyU
 DQTA==
X-Gm-Message-State: APuU4Z9z6ubi0V5xQOBkHHmca6jRFAFsH+aHEPh0ILP7cYkiL4kwgJ51
 X4tUqDBrP+68dGjLW2uWgugZqORk90W/AAR8mFKkNbGdRJh6kGP1J/6VEHZyoooVYAljuFlgwII
 /3c30OYc+L2ysGmfDGWW43N1BO8X2CxPuX7Qj6YsC6zaEhQILodgQiRUidw==
X-Gm-Gg: AZFdTZdqOJdPGfHI+/xYwP2XDgipK+I36x+b7xy/ngxgXGqf1gCCNiwXt1zrFoHzQIZ
 YVZzJ1dtLvizN5bc9WLeCkPRVqUaPn2EEq1ZXwzk2/ggvlVkXPU9cCXfZuSi3+DndekWcbxIUIg
 OC/TuxHjPUohKTPwf8eK8F/gpGwsltp/LcG3WYaJx67Zrwm35382xGVyMeJbARwVNKlSPxG/Qfm
 j39X3hkmywfNmiAO5XlQHSAqTmdBy+Rg0J6wpa3eGa2I5vs0aWXuAC3g9kxMVCKQ1B/RSO860rr
 U91ovLlGYnap6NEGy+nbiSf3CvZXNtX4Ohy7Ey2o8W2G0qDLpKM06oBRwdTOFurefq9cqlB9B26
 g/eCwBXQ5SjUBn4RTUoP9upolBIbGp7+XOYNkw6cCH04yNrpVqpFWdRM4g6ImflmJgHLU+K47NT
 bM6jEIF7YC/Q==
X-Received: by 2002:a05:6214:234d:b0:91b:5d39:e134 with SMTP id
 6a1803df08f44-9212e115993mr330213516d6.31.1795612879643; 
 Wed, 25 Nov 2026 05:21:19 -0800 (PST)
X-Received: by 2002:a05:6214:234d:b0:91b:5d39:e134 with SMTP id
 6a1803df08f44-9212e115993mr330213056d6.31.1795612879147; 
 Wed, 25 Nov 2026 05:21:19 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm160836946d6.34.2026.11.25.05.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 05:21:18 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 13/15] target/riscv/tcg/pmp.c: remove no-op in
 mseccfg_csr_write()
Date: Wed, 25 Nov 2026 10:20:12 -0300
Message-ID: <20261125132015.229955-14-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
References: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06e0d0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=sd8IT5uBP3HpCvPSugYA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 5AQEuMpa2EeTbQ6QRg4c5bjU-4CxJVD5
X-Proofpoint-ORIG-GUID: 5AQEuMpa2EeTbQ6QRg4c5bjU-4CxJVD5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX9BQaS9FhDCLJ
 Guc9QZ23c7Fk9Fu+N+DNG+qcPeL2nbJaorO+PgSyi6LxD5iRL20+UfflVo1AXBWJ1ItR8SLM4TS
 9LZJBVI5ClRRTC5n2lZwYPxSauLvc30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX7ftcu7+b+Ufs
 kkYLQclOTeyAYphPaDTy6pEGL/Da5RgUlbac8YYNaNUFW7oOuCYUsJ75ofMpqXq5HF5wV51L5LA
 07w7+BvgpHIIbUGCEuHdJh/ic/mJo0ipcf38OAD71mpHkXh2igicIkAJ5Czzy6GZAJD8BkFMCQh
 cJOhqjd6Jq57dN+H4I/qX6lUWwLGTyx8H2wbI4hbaWI/xbc46QoxQDkMauxySLQ5/Glrowrfz5V
 DxI5oj4oLIyFvg3sP3r8nINfMLpuqdxF0RsYEQInb+QH51gA3i99vel7S680CCpZ1ay3kpsUyix
 gkCLq700y8QQ17JDbQxsfVIB5QShp45RVnFIXiikQl0GxnBE8ceYn4EdyiQrP76rqjjQGb9fGOj
 rrYzZIPA3nJXQ6LN3dmjxEB2ft2j/AEqJFaoFmZL3QN5FSvwW+kMBMR3jqtN7KsbPK8n/llaBIj
 LKx3lsWIQrS01v5hziQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a no-op:

  val |= (val & MSECCFG_MLPE);

Doing an IOR with 'val' and a bit from 'val' and storing it in 'val'
does nothing. 'val' is unchanged.

If we analyze the commit that introduced it we might have a hint on what
was the original intent of this line (a bit clear ... maybe).  We're
going to rework mseccfg_csr_write() in the next patch though, so instead
of trying to figure it out we'll just remove it.

Fixes: 4923f672e3d7 ("target/riscv: Introduce elp state and enabling controls for zicfilp")
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/pmp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 021ec978b5..17ec81f028 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -720,11 +720,6 @@ void mseccfg_csr_write(CPURISCVState *env, uint64_t val)
         val &= ~(mask);
     }
 
-    /* M-mode forward cfi to be enabled if cfi extension is implemented */
-    if (env_archcpu(env)->cfg.ext_zicfilp) {
-        val |= (val & MSECCFG_MLPE);
-    }
-
     env->mseccfg = val;
 }
 
-- 
2.43.0


