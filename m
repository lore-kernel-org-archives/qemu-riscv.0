Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73681CD6E52
	for <qemu-riscv@archiver.kernel.org>; Sun, 31 May 2026 20:21:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTmfB-00045u-9C; Sun, 31 May 2026 16:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wTmf1-000456-Rk
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 16:21:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wTmf0-0007gH-98
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 16:21:27 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64V6TIK04187116
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KjeqK4seL66sPDy6/0rSo5ZQXLF9mIMhDvhsnUDjZDE=; b=R4/agwmmCRbKmWjR
 mIkrXrPN39odZ3YxzFd79HAqCccftzoWU1kuFBQ0V10dYPIVqt4O/Ennc1As321i
 Q+2p/8bylTo3uJ5WHux5IOxJgc8IXk4aaW6U4CF+uTkLlBwrgSwr357IPQMORioE
 6c3Dp7fabV+GYDimXyNdMUnltK1dRiQJ3sxYy2CoF0m5slKFpCFTJmiy4DdOPAki
 as3EoHdmGOa1EWCvEtWqgWzWeZs+8DbKrQru3Ftz24jajbMN/UTvYKpMpJGpFx63
 2KIU1Ah09/hwuju+l3KNnN7EBXoxx2JA+/zZQEVd6YpiulXe7nzjIBtwLV9do1VI
 p6C37A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs66v8mq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:21:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8cce42a4e75so19592576d6.3
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 13:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780258883; x=1780863683; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KjeqK4seL66sPDy6/0rSo5ZQXLF9mIMhDvhsnUDjZDE=;
 b=cn2y5EAQZVu9GBhUjBGJlQI4/5lCyXU/PSDw3eQNbjL5ulZS36TU0tbyk4DyURY+3I
 9ghpiTuOvSvDAnpj0W7+GN2CD/2O567SgvFQVuclXrrMdOQqK4GRBsl/Xye5WRR/vlEb
 nXdIUlVxlQo9OinJf3YY++Sm3Svctpbv/G4TDpulxdzEsbdqGh4L7dP1Tl2xQmmUptOw
 FRNA6mlBCCpcGRYjKgOKzW9ArAGnu95dRtHLwMV/IqoSw87SjQqgXXhZupjNQBqXj5MR
 Yta6D6kst8C5PIXqtNo75xVrKlv7CHljApyGQ0iDCrGGEcGBfxLW1m6sITdKIxBv79gG
 Romg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780258883; x=1780863683;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KjeqK4seL66sPDy6/0rSo5ZQXLF9mIMhDvhsnUDjZDE=;
 b=KoldAo3pjeoaJdgY9JDqnHSVhaMTa9DoEkBt38tS4jOVcRgSxStw+m44jSm3GigMiH
 8Qwx1B1Opt7nXrEmLmbeBTYxCZ8FvYpnhSwPyAEIzI22sMyXfANfXyZA2TWxPnl1BOLZ
 GLQZo0HnPUmqIkn0nnhB6QiZ5DfQwFE6Qfx27taQjw+98WGE+goaQ04yKkUHlhaf1G9z
 x7LuffZTQz9Bxfrb6DFbyCutytE8Sgs2hLssiGBGbwl9IqiPDnN/T0jxsgJ/Ol0ASpQ6
 5aNquFyd7/xAVYyBGYohYW8d3dwMylvOhh3sLlk/KCZqT/riw01SS/aDut6YyPZMS4a4
 1aIg==
X-Gm-Message-State: AOJu0YwB+qVfJ8RP911DW+dFLHY7Wdu7Nr/+xuiICE3smgo1V3O1Cw5c
 wYXv0FwUy8yAdiE8bYmnf3uam+0t4L9ofvsPRfRngNj6UoOxO2NLdPqmGBPY8ke2lZ3qjKD8s4c
 a9D4XSHtnXN6VICO6udLpQwYtds3mRMJBsBInhQkt+GkWIOSTR93yCYvdjA==
X-Gm-Gg: Acq92OF54xJ7Zgy8dAq5Y/YEqRT1wKBL5Q6x0JZDUxz5w3Bc8UZAeTQ4bvBYhbdzCtR
 jHAfF4sCKpHW5903UxvW3OJUQrVd6SVUif/XSzauHEjUyJuND/p0oxpQiiJJYe6qIid/jVHSMQt
 gq2UAnxSbFtMfk8z2qbyXUH9g7xQgWPMndAdRAFmC5NJfutMpSM5Hn5Jc4GHgOE3cfghh14X53q
 mbvKNX5xp2mqqIAHv60no5yIba1AHnLyT/zqOYd5ImKAJTuR0TnXKd+uaX7GrUHSyQ/8X3cZBVd
 Itjco9Sdsw6xDhYXQdxow8OMuGbf7HOvHA71kTZFeto0SwZ0Z5Mi/6JNv+acaXNhHJ0GtIHsZLx
 1PNkzXL4QD5ap4TuVn39uaeT5y98V1IAjlgcb9xex96CBBRFkxp3CBoCOxYFaRJQaAGef
X-Received: by 2002:a05:6214:419f:b0:8cc:f882:2564 with SMTP id
 6a1803df08f44-8ccf8822883mr99000636d6.40.1780258883037; 
 Sun, 31 May 2026 13:21:23 -0700 (PDT)
X-Received: by 2002:a05:6214:419f:b0:8cc:f882:2564 with SMTP id
 6a1803df08f44-8ccf8822883mr99000346d6.40.1780258882667; 
 Sun, 31 May 2026 13:21:22 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ccea042bb5sm75710756d6.8.2026.05.31.13.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 May 2026 13:21:22 -0700 (PDT)
Message-ID: <e9481765-c3dd-4ce5-87a3-a35736c5444c@oss.qualcomm.com>
Date: Sun, 31 May 2026 17:21:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: fix invalid sstc predicate in gdbstub
To: Abhigyan Kumar <314abh@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260530053200.902591-1-314abh@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260530053200.902591-1-314abh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDIyMSBTYWx0ZWRfX1tbCLat4igNF
 fcNQ2geAqDJcxq50/S785Dn09X+QZoX/urAjLM4amDvbsqmnvYZEl8C5DP8H6RHQjVV3VJyo9zE
 PF2pjptZgeli55s3i+qFX5sVCab2L3bHC8/j/KzY/mN4lpqcI3hF5E6USca4rDMHE4Z+MnG+DwQ
 9L7eBxyDvAw4+mFl5AYHZ9aU/IUu98jDrpvD/rZejFnie0+1EbZ9IkbaRfsshVQ9pMY5Cbn39QV
 KO9E5ThbSD4L2aPYOSabdiv8q6SVu4obejj8AxEnvEmbl0JVOm2XGseMysuLU5aZE5xiRQfxGCO
 qaLx5/itt/jYYa+eyESe4iw1fp8kYKX0/fLfovVFjhgslJvcco3QRZvCWDPYzLUuKlyt5Zgej6g
 rzU0BbdOH2ooKoLyNwOJVjt/ATAnh4W3fdfqYnYpt3jb3bSEiADgHi9Coox3egmFGcoa11bRGyq
 ppnQM3oOpnGE3xdO4kA==
X-Authority-Analysis: v=2.4 cv=X8di7mTe c=1 sm=1 tr=0 ts=6a1c9844 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=wd-fH7nAH_oVZBzBhrcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: J0ybtXeXwR-JKRiStZALTbv8nL8nX1ml
X-Proofpoint-GUID: J0ybtXeXwR-JKRiStZALTbv8nL8nX1ml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310221
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 5/30/2026 2:32 AM, Abhigyan Kumar wrote:
> sstc function incorrectly checks for avaibility of env->rdtime_fn.
> This causes it to fail each time it's called because rdtime_fn is setup
> later in the procedure (when timer devices are created). This prevents
> stimecmp's addition to gdb.
> 
> This change ensures only the riscv_cpu_cfg(env) check is done. rdtime_fn
> will always be NULL otherwise and fail.

I am not sure we can do that - there are several boards that don't create
the timer that implements rdtime_fn (e.g. spike).  If we just remove the
check we'll break the sstc check for them.

I suggest using the 'env->debugger' flag to skip the rdtimer check if
we're running the gdbstub:

$ git diff
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5514e0f455..63f4795ac7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -590,7 +590,8 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
  {
      bool hmode_check = false;

-    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn) {
+    if (!riscv_cpu_cfg(env)->ext_sstc
+        || (!env->debugger && !env->rdtime_fn)) {
          return RISCV_EXCP_ILLEGAL_INST;
      }

Testing with gitlab 3496 this seems to work:


$ riscv64-unknown-elf-gdb
(gdb) target extended-remote :1234
(gdb)  p $stimecmp
$1 = 0
(gdb)


Thanks,
Daniel

> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3496
> Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
> ---
>   target/riscv/csr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f5b0895fd..d72df945f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -590,7 +590,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
>   {
>       bool hmode_check = false;
>   
> -    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn) {
> +    if (!riscv_cpu_cfg(env)->ext_sstc) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   


