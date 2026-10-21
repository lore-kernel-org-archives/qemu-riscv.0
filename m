Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B503F606A319
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 18:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2w0c5CC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dws+QpN8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJasR-0000RJ-R7; Wed, 21 Oct 2026 14:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJasC-0000D5-WD
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:17:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJasB-0008Pb-83
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:17:12 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LHpKFd2415972
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tCmatb9szwmZFl0cegMmwdEcF24WfjGHsE4rsDbT2vU=; b=l2w0c5CCB+4/BXKS
 sy7jmd4dkGJYN1TRXRNeYCt6pQ7o7Tu5qnrZDahlMgshvtL6OxRF94kGOX3YGoqA
 jyR2ONNxU8EW2U/Zd2fMDfiKPG6MoMGcsJc23zTCPr32wQj4lvUj0G89gZ38g+C0
 GCwjBiqlcKCXtdTJtBSi/gEPASp3i+Lb8R0DXcYcB7cYBZQQadyjckU0oaehs15I
 /nldxxHyc6mAMNWMfAArPelMePC4V4Xlibe8bnZrNdqPk7HC2roNkaB8IPDZirKo
 UouQLZoHTEfkSRr3ahTpO91AsRBou+Uos1zcpt7C+0xdZK0unadxYNOZHXt5//0J
 bFFIjw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuj0m4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:17:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f26dd2165so323301685a.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 11:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792606627; x=1793211427; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tCmatb9szwmZFl0cegMmwdEcF24WfjGHsE4rsDbT2vU=;
 b=Dws+QpN80CR3aoFuDJnDxDbLKwtBHReX7u+NWVnBgEBHasUdL9I9porpePEOyKdQRk
 0yYurKIB8WZxGHOPtwbjbu+IkClA7d5hu2ucLmnCvvvZJfTSyoDUsTjG6va1a6LIOGvz
 xa095y3OCwJ+70Z+7rVpieLlm1CBeVxAhpdxy27enkNWI7M5SKN8XyVXXT2CIkzosxdS
 xrExpbW+F5YgWZa3vWZPC5JqZ/pkfrO8ZxAxCuHZtjryD2BSGTXgmQrL3//WUDLr/Ao8
 fb4CufeAA3uzvNyweITonnKZYtvtljdtAZrWy78jRE4zpX0d4ftzQQJE9hecz2n9Qvva
 jVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792606627; x=1793211427;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tCmatb9szwmZFl0cegMmwdEcF24WfjGHsE4rsDbT2vU=;
 b=KWV0eBvba04YJFVGmIWWhW+LbUQalvRgI5tMBQrAam35vI9xnZExmUJOMgzdZRp8um
 FlhQl90VN3gS3Gh75d1JH/KAjdRddX9Q1LQ7qI8yN+ULhT4cFUmf2z88KuC2C1Bt+BLw
 KSxM+1aPTkKYVgbgmthIWRnACn9MnH+OQr6yP9jHb7rXs8Ku7CU5fwM5ixWMRoNPrVe+
 55tmoEEs7HRvEN2CBYzGEeKELjREBLtReSZwByL6S4kYqxoHTx5Vh3zS3kFAyrmwTIR/
 uda/jkX1qqV1wLs27r6WsdpvzNwO65DaqSx93BR9WAnEfMJtLqLEWiY13sfraU8RwIZr
 ekGQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw3A7yRWjL9zS9i7AeC4W7kOrU31KeizExBiV9J+DtYkh0la5L1tEbvvbbTdEOk5bCEzDq+WEANwWA/@nongnu.org
X-Gm-Message-State: AFq9FYJxvQdoCuxt2kMZMB+p3c32HoU0DjZIsr16gH55blramOIVkC1O
 e1274KmrcqUk4+Ag+eh12os/7LWBJ2tt4ergYYVwnwSyIP+3AZysgYHkZ5vcq3MdN5j3HtJxvmO
 iMQUmW3XZHxzoq5ES31SXlrqJJB5wt3SEzbU5z+N9KBpKBFNk+huFP5X/Xw==
X-Gm-Gg: AYBFou2YE94by8Xkr6GLmijFkLmvfb6euclspIwJj3scfQycuZfwBQSld4i3Ploo5Rd
 iOcK3hQ6Hls97Kx2eV5GBId+jrn0KOVowTn6MroDpVqDv8diAAlMiRhPM/m5mtGTULIvxUdUQRT
 xnTL8Co0FtkkhSym8hNMa8YRO64iHzSEEy4JGQf59RvPqM2jX3m1e78gT63mKfTsf0gh6jSDiQM
 NGjOLCeijlhPgnkgTtjaHmNRypj2rW3BfQsXkUAg88PeCK15afZan8wQQP9ltCW5hGhuFcElbAb
 7pCaobnId72l3vQxWIgcRap0Y4FY7Yz0YxcON1bF/mAsD7D1LJ8uooxB0IMlNd5lofpG/XlihpR
 jcDUrUIccqF28/WyKV+gxzcBNOGTL1Vt3TmOOVd4fvdBYOxPo9BNTl0/wJNjO7By8iyhTLwr6
X-Received: by 2002:a05:620a:6889:b0:93e:c12c:fbbd with SMTP id
 af79cd13be357-93f57f979b2mr576253285a.74.1792606626581; 
 Wed, 21 Oct 2026 11:17:06 -0700 (PDT)
X-Received: by 2002:a05:620a:6889:b0:93e:c12c:fbbd with SMTP id
 af79cd13be357-93f57f979b2mr576248385a.74.1792606625992; 
 Wed, 21 Oct 2026 11:17:05 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f56d9acd3sm318143385a.14.2026.10.21.11.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 11:17:05 -0700 (PDT)
Message-ID: <004ad2ad-c9ea-4900-8890-7d06ad59bfd4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:17:01 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/riscv/kvm: Sync SBI STA shmem registers with
 KVM
To: Wang Yechao <wang.yechao255@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20261017145211.219258-1-wang.yechao255@zte.com.cn>
 <20261017145211.219258-3-wang.yechao255@zte.com.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017145211.219258-3-wang.yechao255@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad901a3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=Vh72rk8m_-1sL1oCfmAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfX/G/5MvLzEn83
 Xc9KKfK47TyHAmO21kmM1yJ+kzB1Rb7WPXo7kyUhJRm+xYTyb0GEafdRKimODX7S29BV07kKS4q
 qCQ2c15giLM9WDZXWliahPHppW4sAE4=
X-Proofpoint-GUID: z43aFZKG_33Fl0msNf8yodFchoPFifj8
X-Proofpoint-ORIG-GUID: z43aFZKG_33Fl0msNf8yodFchoPFifj8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfX0fkri37KBmO4
 QAnBFQ6Da1sa3i8m8jfTKn2I+RrxPZ7KcJn+FX+fYWtQx0QindDqOKQ/H8PE51SQgBto5r3uNgW
 A1WmTNfL2y6p2uJC8zfgdZePi+3xnwkP1PmWOs/cu7l1kGIdSxOOMlyCatItcwJu+l/eafXgd4+
 Y1Khp1jzg36JaUv9GYOauzYNOW+Pe+bz3BuL3iEHLrcRxyBb4etzwwAGpWhbna2e33nKF5ofBsZ
 jDhM0DxaLIjqzhiCMWuMOEv2gqUZ/LVX6/W/1sMAu3m6pOg8KBlzjJKFYd4geLnakJ6dWHqRr06
 QqHdJmQE+cbv2nHSUamGMU3mv8cTFzSIMz1VwaVwbuIXPBrxBocb2BcLfmHYMa0wewpg2U4rFKb
 JP3XNl7Idimswcwl1TPRvD6qMTNhTFwuYSC0KjTk8POx95oMWqPzTDUwUOyqpb/4dVt+qpy26fm
 eUTV68DDbS0BVTRIIow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210072
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/17/2026 11:51 AM, Wang Yechao wrote:
> Now that SBI STA support is detected, synchronize the shared memory
> address (shmem_lo and shmem_hi) between KVM and QEMU using the
> KVM_REG_RISCV_SBI_STA one-reg interface.
> 
> The shmem address is configured by the guest, so QEMU does not
> need to perform put reg operations during reset.
> 
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.h         |  6 +++
>   target/riscv/kvm/kvm-cpu.c | 97 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 103 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b65d631994..4da7963d3d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -34,6 +34,9 @@
>   #include "cpu_cfg.h"
>   #include "qapi/qapi-types-common.h"
>   #include "cpu-qom.h"
> +#ifdef CONFIG_KVM
> +#include <linux/kvm.h>
> +#endif
>   
>   typedef struct CPUArchState CPURISCVState;
>   
> @@ -550,6 +553,9 @@ struct CPUArchState {
>       /* KVM multiprocessor state */
>       uint32_t kvm_mp_state;
>       bool kvm_mp_state_loaded;
> +
> +    /* kvm sbi state */
> +    struct kvm_riscv_sbi_sta kvm_sbi_sta;
>   #endif /* CONFIG_KVM */
>   };
>   
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 8ab43432dd..ba5ba63854 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -123,6 +123,11 @@ static uint64_t kvm_riscv_vector_reg_id(RISCVCPU *cpu,
>       KVM_RISCV_REG_ID_ULONG(KVM_REG_RISCV_VECTOR, \
>                              KVM_REG_RISCV_VECTOR_CSR_REG(name))
>   
> +#define RISCV_SBI_STA_REG(name) \
> +    KVM_RISCV_REG_ID_ULONG(KVM_REG_RISCV_SBI_STATE, \
> +                           KVM_REG_RISCV_SBI_STA | \
> +                           KVM_REG_RISCV_SBI_STA_REG(name))
> +
>   #define KVM_RISCV_GET_TIMER(cs, name, reg) \
>       do { \
>           int ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(name), &reg); \
> @@ -1010,6 +1015,88 @@ static int kvm_riscv_put_regs_vector(CPUState *cs)
>       return ret;
>   }
>   
> +static int kvm_riscv_get_regs_sbi_sta(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    target_ulong reg;
> +    int ret = 0;
> +
> +    if (!kvm_sbi_sta.supported) {
> +        return 0;
> +    }
> +
> +    ret = kvm_get_one_reg(cs, RISCV_SBI_STA_REG(shmem_lo), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->kvm_sbi_sta.shmem_lo = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_SBI_STA_REG(shmem_hi), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->kvm_sbi_sta.shmem_hi = reg;
> +
> +    return ret;
> +}
> +
> +static int kvm_riscv_get_regs_sbi_state(CPUState *cs)
> +{
> +    int ret = 0;
> +
> +    ret = kvm_riscv_get_regs_sbi_sta(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
> +static int kvm_riscv_put_regs_sbi_sta(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    target_ulong reg;
> +    int ret = 0;
> +
> +    if (!kvm_sbi_sta.supported) {
> +        return 0;
> +    }
> +
> +    reg = env->kvm_sbi_sta.shmem_lo;
> +    ret = kvm_set_one_reg(cs, RISCV_SBI_STA_REG(shmem_lo), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->kvm_sbi_sta.shmem_hi;
> +    ret = kvm_set_one_reg(cs, RISCV_SBI_STA_REG(shmem_hi), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return ret;
> +}
> +
> +static int kvm_riscv_put_regs_sbi_state(CPUState *cs, KvmPutState level)
> +{
> +    int ret = 0;
> +
> +    /*
> +     * The shmem address of SBI STA is configured by the guest. During reset,
> +     * QEMU does not need to perform put reg operations.
> +     */
> +    if (level != KVM_PUT_RESET_STATE) {
> +        ret = kvm_riscv_put_regs_sbi_sta(cs);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
>   typedef struct KVMScratchCPU {
>       int kvmfd;
>       int vmfd;
> @@ -1433,6 +1520,11 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
>           return ret;
>       }
>   
> +    ret = kvm_riscv_get_regs_sbi_state(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       if (cap_has_mp_state) {
>           struct kvm_mp_state mp_state;
>   
> @@ -1520,6 +1612,11 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
>           return ret;
>       }
>   
> +    ret = kvm_riscv_put_regs_sbi_state(cs, level);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       if (KVM_PUT_RESET_STATE == level) {
>           CPURISCVState *env = &RISCV_CPU(cs)->env;
>   


