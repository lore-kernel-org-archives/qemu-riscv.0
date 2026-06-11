Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A968CCD98C6
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 07:10:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXZY0-000597-Nl; Thu, 11 Jun 2026 03:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXZXz-00058Y-2m
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 03:09:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXZXx-0003KP-5x
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 03:09:50 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65B5GLeJ3724999
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 07:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NtHiAaWhHlAMHu+Gvv15GI/pF2yR42QIx0sL18LJS3M=; b=OlLs3bweLtiYIhzJ
 whWB6EMsf1i/jVaZP5E+kMUO2lGF17tN3sB+wwyIkizjwLZefmlPVXqnPFi5BH0e
 mcWlPvxI4d4MzwStklqqYdm4w3oO/fdqVDQnVJUvNIwF0EkOOl/uYZ9HVa4Ag/Xw
 FOuNpvXmtZk69U2RVVfnzRqpAYRgeJG2BYplpzXJLfZLjnm0iNK9avBVJ4KsMH1B
 zx6/vq1Yo1Q71Xx2v/8iajQoCBr/uyGbieOCHhambjtVfC6VfdGES7QDdGC9RDjx
 Gc7UHHE8Nhhugzf3NBhoiCBy7/ZBUbKySQYHGepLQ8Ihs7hv7Im5W1OTSChlPDSn
 1bNbmA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6va2xd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 07:09:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-517dadd84f8so38452431cf.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 00:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781161786; x=1781766586; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NtHiAaWhHlAMHu+Gvv15GI/pF2yR42QIx0sL18LJS3M=;
 b=AKKsapYJcLjT32+YBHbLa4urz9o7nvYcaCe5kvD8PfVVGBxvt9BbAEHK/BMFYuwXdX
 F0euKOL68k1ButEoeroDbQaHJpDp1yVFekBN3IEgH1TGXRTfccI1Uxmx5UvhkvZy9Glz
 iQ9YyxM0OqKaLgr5Y8/dNArSa8hLYOpliYWt2nBJKZoL/GX9HgQOIsWTrcUoxVvl62u1
 h++D9egZjJY6nRq/LDpl5SrCG25HQu9PYv38szSGpApUP7QrEPV+i2+r7dDixsCOLwRH
 Xtz87mUxmZhkLI/QO827OFAZd+vmPfnvML6opYmHhTwKxCnSSOc7g/t9UvEXTmFD2oAV
 U3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781161786; x=1781766586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NtHiAaWhHlAMHu+Gvv15GI/pF2yR42QIx0sL18LJS3M=;
 b=cYWG+slxKldTjLkYPr2RtpR6iGBGGrLjpuJ3vg+UI9qXxuOIHIAMxjcBJ3Fky4peiq
 o1JGDyZoQiscsmSt+gbyfcy0tIrlCrxTvMl28PJbXAr3yfrOePAvBbdcDzlp/MbsbvKJ
 jNtQGHo3GrKuhgYjATwKKi7f1vNzrncSTmYcEXF2apa/LJUQoKbYTyNyCGgbr5I3rS4E
 QqBa5G4qZM9kVa0q2yf+qv8OekytklTsz7Fzjwpsw8gymJXKcadr4k864WN8Uvdk0f8V
 8+9NY134BlM4L3NnZD8XmiPekkceXdyYBM8KakO0ykG3QLtje58U0Aaj0eVcxE89+06h
 gJgw==
X-Gm-Message-State: AOJu0Yza2oTErvpO8Qq8PhK0+La8HBP8f/yovmGyj62ki8//PrbBcE2g
 x6zTPtSXjx49lSQEYZc1Rfdt3srTmxdBkZA3qozCkY/cAvXWJiJuwtgWGrXw9PWY/OWxU/UVOwR
 Gd4ey7vwRtG0H8xwl9dzf/kPpVIoVI3F+1UB1mVVuVxdUkshU1I3JDFPFIA==
X-Gm-Gg: Acq92OFY1gN+DVH4RkUrNUtCjSkXywgcXE7DwOWpwd1umF47wErha4NqwmRlf4RtdPn
 VUX0zEWhcKN/JccFuVKdIUncH5t8LqFvQ3sW0z3MXEiYd43qkWOBlTasYGg/UEIbBPg45065j2+
 u822X+5glme8UOoIrX3P1ApkCE6WlOSlou53NwioEGvuPdre00DltK5kekmpE8WwvCcTux9DDcn
 1VTPd1CHJfGi4BoofxUsu3vSlMSbiP0hQk1qZgJPa3dQNpk8mssirqBWQVq1adSKCosyNwLvQlY
 cDONxRoH7GRcWYP/6xM/5Gx+Mjn3xcdqVcOgvBfQbhCf8NkPKF0XozKgIRs53P/qU+Kn11Y6+qh
 zB4vH/rWgjI+P3xfFeVVGbBlTk1UrCiO12l31CKPEm9zK69Vy5Wj0FabUDSviiW8fRkeMefq+Bw
 Jn
X-Received: by 2002:a05:622a:17c8:b0:516:e39a:8540 with SMTP id
 d75a77b69052e-517ee25746fmr24490791cf.48.1781161786216; 
 Thu, 11 Jun 2026 00:09:46 -0700 (PDT)
X-Received: by 2002:a05:622a:17c8:b0:516:e39a:8540 with SMTP id
 d75a77b69052e-517ee25746fmr24490391cf.48.1781161785724; 
 Thu, 11 Jun 2026 00:09:45 -0700 (PDT)
Received: from [10.156.84.244] (218.170.88.92.rev.sfr.net. [92.88.170.218])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68e65027662sm10722132a12.11.2026.06.11.00.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 00:09:43 -0700 (PDT)
Message-ID: <380995c0-fbf5-4f1a-a996-fbf39513c166@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 09:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/riscv: dynamic alloc of debug trigger arrays
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260610205457.1868701-1-daniel.barboza@oss.qualcomm.com>
 <20260610205457.1868701-2-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610205457.1868701-2-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v4g5ar13z2qIKRmq-_oS3dUkZZxYSQcn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2OSBTYWx0ZWRfX8lX2Hqtk8/t1
 oDUOUnl5jF4Z/3F4r06LhzCAg/XIw5yd+gXv9I9OP3jTmSj8Q5JVBe2r7mu756LIRYgqlZVRHSr
 80GUz44ApOP+y1jRmIZq6MXwaDqWO2Y=
X-Proofpoint-GUID: v4g5ar13z2qIKRmq-_oS3dUkZZxYSQcn
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a5f3b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=/nYmEve+L4YsDi96RCWAbw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MWUFoOrsk-nuDVzXGLsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2OSBTYWx0ZWRfX280XgNIoIwkz
 ZQ3fopqX5OzFTdDNx7XQTnggh7GghDo+A9vGHhk8ba+YYN1oEkHHB6bYWF9UAbcnC08GtFyl/WB
 o+YLATI51bHehbMjr97BpSYT3WsNODbiBMyuhbniuJ891Fzah8/leIqWriJwJAHYyBW748LrqPA
 g8vQvC7i66wsgvYXDg2z+CviMrasnt+TzkGFUdi0NM2e6G+JZiWypRVWiJh7BpHF8D488qVtKk0
 j1sm+6WutNHcAmvFUVbOaeKHxAtOU9+08072bgbnQBG4rxbDMrW48+Dyab+eCDY84LDEfANlcUD
 TtZxYamu29SGvbkZybKrmrDLYTYP9XYj22HKvRi1Lg2cUz0cCnsbYufTiY5ShO+po+CNahhsxZy
 6pc6KxiA+jCu6i/JxXFdlZq5/Xu9sAX27YUTq8OQOuC4jrxhE11/K0SiggPspjrrPSJIHQ9UQQo
 mZs4cmJtF+IAId9huKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110069
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 10/6/26 22:54, Daniel Henrique Barboza wrote:
> The debug trigger facility consists of a set of arrays: tdata1-3,
> cpu_breakpoint, cpu_watchpoint and itrigger_timer.  All of them are
> static allocated with RV_MAX_TRIGGERS (2).  This means that all RISC-V
> cpus will have 2 triggers per hart.
> 
> The RISC-V Server Ref demands at least 11 triggers per hart, and several
> CPUs in the wild works with 4+ triggers.  We need more flexibility, ergo
> we need to parametrize the amount of triggers and make it configurable.
> 
> Before doing that we need to handle a situation faced in a previous
> attempt [1].  We were unable to set the tdataN array length in
> vmstate_debug, meaning that we would always migrate RV_MAX_TRIGGERS
> regardless of the actual amount of triggers in play. To fix that we need
> to change the tdata arrays from static to dynamic, allowing us to use
> VMSTATE_VARRAY_UINT32().  This also means that, in contrast with [1], we
> have the opportunity to turn all trigger arrays into dynamic allocation
> and reduce the amount of stuff being carried by CPURISCVState, or in
> other words, we can carry just what we're using instead of a static max
> value.
> 
> All the forementioned trigger facility arrays are now dynamic.  They are
> allocated during realize time in riscv_trigger_realize(), and their size
> is expressed by env->num_triggers.  All relevant code is changed to use
> env->num_triggers instead of the RV_MAX_TRIGGERS to loop through each
> array.
> 
> This will make it easier for the next patch to parametrize
> env->num_triggers.
> 
> [1] https://lore.kernel.org/qemu-devel/94c772b0-5231-40e4-9cab-6ac39b9e4d45@oss.qualcomm.com/
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.h     | 18 ++++++++++++------
>   target/riscv/csr.c     |  2 +-
>   target/riscv/debug.c   | 31 +++++++++++++++++++++++--------
>   target/riscv/machine.c | 12 +++++++++---
>   4 files changed, 45 insertions(+), 18 deletions(-)


> @@ -1049,7 +1049,22 @@ void riscv_trigger_realize(CPURISCVState *env)
>   {
>       int i;
>   
> -    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
> +    /*
> +     * Alloc env->tdata1/2/3, cpu_breakpoint, cpu_watchpoint and
> +     * itrigger_timer dynamically.  This is overkill now
> +     * given that they could be static arrays with RV_MAX_TRIGGERS
> +     * but we'll parametrize the trigger number later, i.e. the
> +     * array length won't be static.
> +     */
> +    env->num_triggers = RV_MAX_TRIGGERS;
> +    env->tdata1 = g_new0(uint64_t, env->num_triggers);
> +    env->tdata2 = g_new0(uint64_t, env->num_triggers);
> +    env->tdata3 = g_new0(uint64_t, env->num_triggers);
> +    env->cpu_breakpoint = g_new0(struct CPUBreakpoint *, env->num_triggers);
> +    env->cpu_watchpoint = g_new0(struct CPUWatchpoint *, env->num_triggers);
> +    env->itrigger_timer = g_new0(QEMUTimer *, env->num_triggers);
> +
> +    for (i = 0; i < env->num_triggers; i++) {
>           env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                                 riscv_itrigger_timer_cb, env);
>       }

Ideally we'd implement riscv_cpu_unrealize() first, so
in this patch you could fill the riscv_trigger_unrealize()
cleaning path. Can be done later, but the sooner the
better IMHO.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

