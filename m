Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE1DC55162
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 14:34:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wpRpQ-00062a-1j; Thu, 30 Jul 2026 10:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpRpO-00061V-Bu
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2026 10:33:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpRpK-0006oQ-Fy
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2026 10:33:41 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66UDDCu0715711
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2026 14:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 14dYxtDGXma7qj106lSBvKvs964VplqZz5J6EyKrMCA=; b=QH37Zh0vlvq9G+7r
 GlO5KXRfcWK8PpcI7ETzesjPf1TPQotXrqQ2459ry8aJU0Njf8Ad2Jip2sVihfiB
 F13hItws9G5kOJ4j+QBgWr3OzNkL3q3vyI30BKHfVt1VBBhG0vGQ4XcHqwhhV/4s
 tvD7ZzeshPuvTdpEoYnr6qfK0oOC7atbeWj/PFc1MemTrZ8gPczrABGr2LDsdE05
 J6xXDp03V1uyRJc8wJwjzbd+lAgIr3dvUDjigOLlfGzvTis6IyVdop8ym7tf3vWH
 WEiS5Y0zSh20RRgEpOybenaG8Xg0Tm5wOTT0rRBsrnX5tvZdRc5cR5KdZ/XLsmcL
 jyUWQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6ucrgja-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2026 14:33:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso24280641cf.0
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2026 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785422015; x=1786026815; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=14dYxtDGXma7qj106lSBvKvs964VplqZz5J6EyKrMCA=;
 b=Awrh7bQazWP3tkoLlxPxKk/Ob8YQ2ncr2kLVfmDB7twN8o56sMI4d+JBgGrzP2NYTB
 6PZ9uVbsIX8X12OhnDETwj7okhFJxSkcmowP1rDwIyIVrNiguqkUxWJJYVFzo19VXNfk
 XlEqSFRK+rk6vLh2zBG4/kpOPIdxyBK5r5qfidbxDHZcrxUqBq2qj+rsuwCxgbzcB46/
 Yeg5k8F1n9KCcSYFiQjJ0rptFPZJjujJ3DWELw2ccoJmHwRCIeubarLsROXNw6fgkZJX
 Y5ijr50blPLU7XsHWljEoCPxMxx7fWDf1m6Pcc6QUr02wI83yOMeDvX/BA17qzAiSYUw
 v5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785422015; x=1786026815;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=14dYxtDGXma7qj106lSBvKvs964VplqZz5J6EyKrMCA=;
 b=hiZiZDqC/bWO4KxxE2CkPQSDBJaTYG7ZjI4AUph9uwIz2J7mF0wmGdMmSGI1cxSAO9
 m2y9yhnA9IiadyZvXexwepKGfzaWlFeVrC78SKpP+9A4OYlH10xj478io5cvUGCPdhb0
 SnOiE2c3t1Jg8aWaWE3ZSIwDh4yW9bINaxNE9RsU1V1KG4xPGHhjVPtv/nFK0Goyf4gF
 nUCZqIqyxxmgqPmkVvshTJlB+mNHccNAwR4/mwkuBAr3adOfalhy3DiKeOl1syra/XAV
 8VFoziS7Sw8Z3fA+188BK1g+4Ez2Qt3Fb/VGeutVkx9Y85MtJuie5qLSvZJECXX7drIM
 I8og==
X-Forwarded-Encrypted: i=1;
 AHgh+RqA/YuwNYrdHgxJkxdWN8r5zl5oj8ig2QvXwwF6sKFg6Ie4MHZtulDaM4SXlFJDzOvNzYoTaJM8BcY4@nongnu.org
X-Gm-Message-State: AOJu0YzYFGklWsNjJmr5tZAmNMMVrCSAMiw2w5Re/PftGK0rG09QA1AY
 RYdcm/3rgl/4xKISovW64JG9FSpDKPtccJHkGQ5mhyI81EOyOT//1OH0d9igC8bIB/3bkMn3EOj
 z3W+I8z07YhRE6PDJRjGR0nxYlXHdWWi3sIRk1CNv8r2Ktr6ZtlVGu6/2kg==
X-Gm-Gg: AR+sD13mNRBUny/pDFrTN+AUHeXIlSq4mlSQUTgBj4q+IHsjXqxke/gEztZeo/i/Hxw
 Zb3sHUfQ/Fqs/1464N7s5jyUUwf/BAZm9EehkizM95ZPrl+s8gWGDESiEk77VlOHqal4oLMmqWI
 62l531OjuAjYQTvLJhlkbgIcrHnKGSD5Gtx4l9f4bpV/mv+kbL75aSjR2VVdlxvA8Wt/BeykbPJ
 p8x7XqH7g11+1UIsJmlzi38svZIFUboBs+AHhZjYIGDoO2b4Kb0xzH1KXjFt3rcg2QQbOPmIIaJ
 pjKNo+P74jbygGqbGUxXNqAm4cd3V2X1qzOqh4im6UDWvmcCC1TSqqLWgnuN8nApPUN9crZVBv/
 T0YW6H5YHmtYyvqKz0canm6sju/FGAc4zvK5w/H1YQ5pewUXFH8w=
X-Received: by 2002:a05:622a:14e:b0:51c:7b12:5fde with SMTP id
 d75a77b69052e-52b386c4309mr29041361cf.74.1785422014699; 
 Thu, 30 Jul 2026 07:33:34 -0700 (PDT)
X-Received: by 2002:a05:622a:14e:b0:51c:7b12:5fde with SMTP id
 d75a77b69052e-52b386c4309mr29040951cf.74.1785422014134; 
 Thu, 30 Jul 2026 07:33:34 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc877dafasm6285828f8f.0.2026.07.30.07.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 07:33:33 -0700 (PDT)
Message-ID: <87f978ab-9813-4d0c-9a8b-e5f2ae70ff9d@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] target/riscv: Clearing the CSR values at reset and
 syncing the MPSTATE with the host
Content-Language: en-US
To: "liguang.zhang" <18622748025@163.com>, qemu-devel@nongnu.org
Cc: alistair23@gmail.com, "liguang.zhang" <liguang.zhang@hexintek.com>,
 qemu-riscv <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20230913083728.16935-1-18622748025@163.com>
 <20230913091332.17355-1-18622748025@163.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20230913091332.17355-1-18622748025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMSBTYWx0ZWRfX9ddP+21GhoAg
 2++8sElCUr0a0SJM7b5JWEY8A5qSB7jj/i+YZeYWS9oE2sUjCnzUHshqQKWfGTzxhklf4+GIgCT
 i7x85K8/MMhcytfEuh2cegsUL2FN/84=
X-Proofpoint-GUID: cVye5eMowZIk8joF0m5zDFHaUdNfAdvs
X-Proofpoint-ORIG-GUID: cVye5eMowZIk8joF0m5zDFHaUdNfAdvs
X-Authority-Analysis: v=2.4 cv=W6QIkxWk c=1 sm=1 tr=0 ts=6a6b60c0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=9HpfiWj7wsRZE823:21 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Xlp9LwTNAAAA:8 a=n3itKfVQ9HkEtyc4GGgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=rg_ZO-Pv9Kk2mYsQ_rSh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMSBTYWx0ZWRfX27HANtWS4WZ9
 a670cKR6SZ8jh5CIqfWZDzJ9byy/QhdaO2tPpWYyjtD4jGATEzWf4EW0M6Gan5fee2tnzEkYrif
 z/Jvje9hc1XksQYmKv9XK05Ged1ulq4m+gnyDl2umPEC5OdyG4uNO6gHL8WmJPF7Z3tenvKi8tf
 1OZq6VQ+MnL8QEhniUZlILJj7F66j4nTzLTb/v2l2xSSDaDwvd74poX6amuw/GjcBR55vYz6qYP
 ufNPQDTqZpOeqVCN/aKJJOuYSjJz0JqlTm2l2+RZwiqOyW6u/ne3s0epNXFAnEsHL7TkcP7EWWl
 Svv0/8+y90md0foAqFWO890NXcgAnA02RfpJJSnOEJiMpzDfiMdi2Bqwm/joCu6TX144AcfJ5KK
 ZRdf2H8UGrXutljCWR+KyfX0TLdg3pNaIF85INIjOoRYMO5gIf0sBK+Dtw7uXsNMzUyHTcnRBVh
 dZ2805LkLdD4Uf48w1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300111
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Hi,

(old patch committed as 8633951530cc923f1e7a6cd250f670f24c0ed817)

On 13/9/23 11:13, liguang.zhang wrote:
> From: "liguang.zhang" <liguang.zhang@hexintek.com>
> 
> Fix the guest reboot error when using KVM
> There are two issues when rebooting a guest using KVM
> 1. When the guest initiates a reboot the host is unable to stop the vcpu
> 2. When running a SMP guest the qemu monitor system_reset causes a vcpu crash
> 
> This can be fixed by clearing the CSR values at reset and syncing the
> MPSTATE with the host.
> 
> v4 update:
> rebase on riscv-to-apply
> 
> Signed-off-by: liguang.zhang <liguang.zhang@hexintek.com>
> ---
>   target/riscv/kvm.c       | 42 ++++++++++++++++++++++++++++++++++++++++
>   target/riscv/kvm_riscv.h |  1 +
>   2 files changed, 43 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index c01cfb03f4..8ee410b9b1 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -51,6 +51,8 @@ void riscv_kvm_aplic_request(void *opaque, int irq, int level)
>       kvm_set_irq(kvm_state, irq, !!level);
>   }
>   
> +static bool cap_has_mp_state;
> +
>   static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>                                    uint64_t idx)
>   {
> @@ -797,6 +799,24 @@ int kvm_arch_get_registers(CPUState *cs)
>       return ret;
>   }
>   
> +int kvm_riscv_sync_mpstate_to_kvm(RISCVCPU *cpu, int state)
> +{
> +    if (cap_has_mp_state) {
> +        struct kvm_mp_state mp_state = {
> +            .mp_state = state
> +        };
> +
> +        int ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MP_STATE, &mp_state);
> +        if (ret) {
> +            fprintf(stderr, "%s: failed to sync MP_STATE %d/%s\n",
> +                    __func__, ret, strerror(-ret));
> +            return -1;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>   int kvm_arch_put_registers(CPUState *cs, int level)
>   {
>       int ret = 0;
> @@ -816,6 +836,18 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>           return ret;
>       }
>   
> +    if (KVM_PUT_RESET_STATE == level) {

Why only RESET_STATE? Don't we also want that for FULL_STATE? IOW:

        if (level >= KVM_PUT_RESET_STATE) {

> +        RISCVCPU *cpu = RISCV_CPU(cs);
> +        if (cs->cpu_index == 0) {
> +            ret = kvm_riscv_sync_mpstate_to_kvm(cpu, KVM_MP_STATE_RUNNABLE);
> +        } else {
> +            ret = kvm_riscv_sync_mpstate_to_kvm(cpu, KVM_MP_STATE_STOPPED);
> +        }
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
>       return ret;
>   }
>   
> @@ -928,6 +960,7 @@ int kvm_arch_get_default_type(MachineState *ms)
>   
>   int kvm_arch_init(MachineState *ms, KVMState *s)
>   {
> +    cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>       return 0;
>   }
>   
> @@ -1014,10 +1047,19 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>       if (!kvm_enabled()) {
>           return;
>       }
> +    for (int i=0; i<32; i++)
> +        env->gpr[i] = 0;
>       env->pc = cpu->env.kernel_addr;
>       env->gpr[10] = kvm_arch_vcpu_id(CPU(cpu)); /* a0 */
>       env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
>       env->satp = 0;
> +    env->mie = 0;
> +    env->stvec = 0;
> +    env->sscratch = 0;
> +    env->sepc = 0;
> +    env->scause = 0;
> +    env->stval = 0;
> +    env->mip = 0;
>   }
>   
>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index de8c209ebc..8f8c1f969a 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -27,5 +27,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                             uint64_t aplic_base, uint64_t imsic_base,
>                             uint64_t guest_num);
>   void riscv_kvm_aplic_request(void *opaque, int irq, int level);
> +int kvm_riscv_sync_mpstate_to_kvm(RISCVCPU *cpu, int state);
>   
>   #endif


