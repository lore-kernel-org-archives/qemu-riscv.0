Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB79CDB47F
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 12:34:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcMoA-0000GP-4p; Wed, 24 Jun 2026 08:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcMnz-0000Am-Ax
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 08:34:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcMnx-0004an-MZ
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 08:34:11 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65OANu2W3047485
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 12:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nAPyGWX7faTZM0i2WPzASbgIb4XCxCXW52FicIh0EOM=; b=O27BRwLA9Gzp+U4D
 HDlpWCTCn0CWwkxDxw6jPhWqW4NAayqn1fNr8hRB17ighO9U4zgekk+Ac+2HvF9K
 aSivfqb2naspMKmvPtGtBaNMOVfBV7kV/PCtcWxD486PZd3dY8dCuHv6uBLHVeO5
 jiwfM2N71zGtGeiAe4nrX8gFEIuJ/GrGeDsxtjpeb63vMZjz+EQL9UAkqV9B9mRa
 nvYcjLlVPMiqZwEVY+Mg/87JNDnDSmUuZaVPA8YWHH9YOba6yML2oIBgkWQ4Z7/3
 vbbSHnLIrr4jnm9BBZZa590l1z2FdXfdIAGd0Co53wDEuweocN3Yn2Ms2UeoTrIo
 1Hqayg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar26ut-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 12:34:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c0d568830so3492119eec.1
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 05:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782304446; x=1782909246; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nAPyGWX7faTZM0i2WPzASbgIb4XCxCXW52FicIh0EOM=;
 b=TkqcuTuXc7XXttWnp54qwKsRwuJlC2mQdJbYvCz3To6PdgE5Z37z2y5H7Ojml+K89T
 NCloQAiMZRfg8bitdLke8CmZ9UqhuxkUeFVUuD3b+BMVqoQ2xKobHQIEDeJqhVutSP3J
 WwW+ZPIFQ5KN1/S/5wxOT9+xrNwvrUdteUEIqtEr0YeyVaM6FV5HEy7d8NtmuM9RuFbb
 TD1WUr4OQPOiEn/FnToR0u1YLwO3I+VrLHqa+GcofDs+RJs7WL1Ymo6K7oir0YRIdupd
 Yk6BAt2TAcMwjqZdW9XBrO2eBArSRM2KWaGwbEVR54GRdGtfgJshVJsmHs/hluSHD6xX
 5cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782304446; x=1782909246;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nAPyGWX7faTZM0i2WPzASbgIb4XCxCXW52FicIh0EOM=;
 b=tUP3YYSQtbFo4mnQ5HLYgWe1BV5nZcssE0F1jz53MAIvUOO0KaeHEcVyKDY7EkRDaN
 lPJoEOnQ6s2878qWgMwjWRIgJehu2m8XAesssv1K1JovsfIVenxYc8SkLU6qbxXDoLUT
 Iwe6jTMcOEAP0a/X0ubooPsZZm0oIgAbaIpUUCDN1cl2btWLcTgP5s/Oqn9FteZK0fYl
 IDl/OAn82Kgf5hnM0t/5SMce97FUR7O/87fEaweVRunmmwEZ/c9e+5+ynzYDFNETawNh
 DwuhHiBwyf0xbr4EUvBftMHigKUpHbYpoh9Ci+C3xBie5SvwNgsRTxYHHMX1MFb3umY/
 x9FQ==
X-Gm-Message-State: AOJu0YxcfeV5LWpvBiriURQBrC1rfiy65iR8zVhYJGQ5XAJp3SuJK//V
 /yg7WQzMtOFA+yPEiaeEh07ghcqgpPfsQSxCOvb6kAtXAYGjOGrUc1E4YQ1uWkBueBTOWnil0op
 jZfSSHoSFK8ct2O8sqLItC5dgyDRYDFw4PleMx1PFSc5uwYzbfqP3DRKMOW1Q8Elx4A==
X-Gm-Gg: AfdE7cl6t96M/9zV9aUbuxDTAXpM8N2TyzqBWB2EAd8J6fNi22DaRaWeHryFoAtCDV9
 pCduvP9bu70T3uswjc/a9EgJzxAdxh4ij3OpvuBlT4MdSKTj4yqUROiTPJHM9NX1J1CTlt8MlRY
 RlcKDBXrA7gRSnLp+T6p+QhMVu0G9Wf+bHeWf8rcZZ5t7G1SZ49rIH4+x/Qi1BXIKAZqhLvdqrP
 nHIQc0XKle/RS8V6ai8/zcnxfshXAxXJzK8ddFqcPYoI5OriMtS3roJlK3x8Zr9ByeBMRc2DE1F
 6qz2sXb01ZtPIGjgGnlqG4BEBOLRQIuSUv1b1ZXxTHLV5DuPy5/KJ10KXqhAnTbRRk8ZlL6aDwm
 JKimEgVuMzbIDeVVCa+niufpnDPtAIDRb0UbEy9zzR76k
X-Received: by 2002:a05:7300:2d15:b0:30b:c6f0:1cd9 with SMTP id
 5a478bee46e88-30c58bb66c6mr7174420eec.26.1782304445889; 
 Wed, 24 Jun 2026 05:34:05 -0700 (PDT)
X-Received: by 2002:a05:7300:2d15:b0:30b:c6f0:1cd9 with SMTP id
 5a478bee46e88-30c58bb66c6mr7174387eec.26.1782304445385; 
 Wed, 24 Jun 2026 05:34:05 -0700 (PDT)
Received: from [192.168.68.103] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c1be4b24esm22779655eec.27.2026.06.24.05.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 05:34:04 -0700 (PDT)
Message-ID: <4e78cb10-dbed-4f22-b104-43f45595f86e@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:34:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix vsstatus.UXL reserved value
To: SeungJu Cheon <suunj1331@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <20260624090052.463075-1-suunj1331@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260624090052.463075-1-suunj1331@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9fuw7izUq_ovzZvq9cplMZBSRSfHcF-K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEwNCBTYWx0ZWRfX8gtIH+A2vij4
 /JKgHCn/S1OGKbqmE/Swo2FTQ6gFy8ZjYK+bYcbZmZcnZDE2oTY9xhMLBY3yvaLyArbB4v7EktC
 31ImY2JHqEVJ0nLyZ+Hi0QP782CeVUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEwNCBTYWx0ZWRfX9S/aNFDXX/fm
 QjgUybzKuBUVhp6H4DvlrwoU+PeSP0chg96aMuiJKfU6+n5Ykek239XeldmbXDBYlB2me/1OzSB
 eg3Ck5vEGdHX2PHzzK0aophQNTGbIrhRGhPwGhHowdzyWIDWYfAoWYZY5IAufHTURpm9YwcC4wk
 aob7AMMK8q/Azwj44Csluy21uZVHhNWRX31oXZnx4gHsWJWUXnhA/lzwQzGZ24aqurCb97PNFcH
 tLv07Ve2TcZrpcsegGX/iq9PDIiJaM4PKn6XiZ7ad5Z/4qH9f9QIVnyXCEvGJcFgM9WKLmDWfHO
 HotukC0ALAtKZw4oTNJ0YXzZkdhMwmTggs0wH02Zi8DJ9n6Gv9Lb/mpxGymGyUWvuP8FZsA3jhz
 uSx8JoBQOIqZK/+633vXeE5iuh/g3Q==
X-Proofpoint-GUID: 9fuw7izUq_ovzZvq9cplMZBSRSfHcF-K
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3bcebe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ca-pEfRt2ID3f-_x_JYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240104
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello,

On 6/24/2026 6:00 AM, SeungJu Cheon wrote:
> By the priv spec the value "3" is marked as 'Reserved' for
> mstatus.UXL. write_mstatus() rejects this value, but
> write_vsstatus() does not, allowing the reserved value to be
> written and read back unchanged.
> 
> Handle a vsstatus.UXL = 3 write by writing the current 'xl'
> instead.
> 
> Fixes: f310df58bd2 ("target/riscv: Enable uxl field write")
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---
>   target/riscv/csr.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index dd9726fcf4..4c1da61824 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -5226,7 +5226,15 @@ static RISCVException write_vsstatus(CPURISCVState *env, int csrno,
>       uint64_t mask = (target_ulong)-1;
>       if ((val & VSSTATUS64_UXL) == 0) {
>           mask &= ~VSSTATUS64_UXL;
> +    } else {
> +        uint64_t uxl = (val & VSSTATUS64_UXL) >> 32;
> +        if (uxl == 3) {
> +            int xl = riscv_cpu_mxl(env);
> +            val = deposit64(val, 32, 2,
> +                            xl == MXL_RV128 ? MXL_RV64 : xl);
> +        }
>       }

This is similar to what was done here:

commit ddfd33f1965804fc4a718d8d46bc150525c2f9db
Author: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Date:   Thu May 14 16:45:37 2026 -0300

     target/riscv/csr.c: fix mstatus.UXL reserved value


diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 83ca354bf0..d004a4bfb4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2045,7 +2045,17 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,

      if (xl != MXL_RV32 || env->debugger) {
          if ((val & MSTATUS64_UXL) != 0) {
+            uint64_t uxl = val & MSTATUS64_UXL >> 32;
              mask |= MSTATUS64_UXL;
+
+            /*
+             * uxl = 3 is reserved so write the current xl instead.
+             * In case xl = MXL_RV128 (3) write MXL_RV64.
+             */
+            if (uxl == 3) {
+                uxl = xl == MXL_RV128 ? MXL_RV64 : xl;
+                val = deposit64(val, 32, 2, uxl);
+            }
          }
      }


But that patch fixed just write_mstatus().

I suggest adding a local helper riscv_write_uxl (feel free to choose another better
name) to encapsulate this logic and then use it in both mstatus and vsstatus to
write UXL:

  val = riscv_write_uxl(val)


Thanks,
Daniel



> +
>       if ((env->henvcfg & HENVCFG_DTE)) {
>           if ((val & SSTATUS_SDT) != 0) {
>               val &= ~SSTATUS_SIE;


