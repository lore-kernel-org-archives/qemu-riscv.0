Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9559CA5FCF
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 09:34:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCDBe-0003cV-G8; Thu, 01 Oct 2026 05:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xCDBd-0003cN-Nx
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 05:34:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xCDBb-0002R8-MB
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 05:34:45 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6916xgGH2337518
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 09:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QDhyweDgm4uV4zqSF981mMWgw38ZRJjlbHP65gAzV8w=; b=lFfwtL/YQM+tTWyz
 7nCXCsNmMtvTxEGhLHyDMwwI1KLrXzB1PbWFurx7ajUUYqis3RuwmjJZZV6mKYvO
 7fQvK88haJKMgZkpsZ63Rc1YSdXOzuCOp4HuuU2sdE9uuYzOYl2rn6xa3drgPccR
 1cowqfg7nLRw19vXoGLHvk94XwJytCIRj/SnhRL7ctzFvn+4FGNrtFzZdMl3wOz5
 Kh5QRdn8lS4Np6Gp9ANVx2kd6WIWV9kkU9iilOqMmA114lQ1QsO3EtNNBZCLnC3t
 dO8Te1h+B8X2hNBeQsWUq6RuXytBrj2VovcfsH1R6a72WqV9oRT7ZlBZuLGtZMfZ
 2JpEnw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n2437j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 09:34:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5338f659170so5875841cf.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790847281; x=1791452081; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QDhyweDgm4uV4zqSF981mMWgw38ZRJjlbHP65gAzV8w=;
 b=DLL4iUavZ8S34ufQs9FON+Hg3ISAUt6j+qo120/zgcqNQqT5u40OfI0wjNIMfVnaOY
 55nqw+Fx8Y6m1ICSKTxo+binI+A/VzKVUdYaO15ND8B44bMh+zRq5QHAF7FqDoWmOLyK
 fXooopN6RRFOp4sdgiVj4DIsY1oN75N2TIGUjRdUmF5LKTXsNo0Cx7V7W0hDOe5G/AC0
 LYUvcdsILinoHRsp8ZbhvzJ7oycDarjLkTGakFeFc6i7MFtde9z+NGfW/5a13M4tyVWO
 Is7EqK2xsHU+Ss//lMM1u7yWUbV1U8bl4RF3/GfZkbEgjWkhC3H7sMrC+ZXH0y1SPnkT
 Q4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790847281; x=1791452081;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QDhyweDgm4uV4zqSF981mMWgw38ZRJjlbHP65gAzV8w=;
 b=ehNT+rvyMEdGvZmHluJQ5QnnnZerlY6HGNqithx2TDhOLTBkXLsR/Gk4Y+7TiBkUzg
 GGnlx8IEWvF3gYO9XBw7ACwhdbgMnBaN7lAZpN+/XbQU0guQr9PYn8AVkakFesYB+dMa
 RsJhZJEike6DXskjJ6wsUMnnbEt0TkgkMWlufjaogWwYCsVntWuxpfswNB9uBOog7upd
 Q3ir+bUsBBpwrilb4qDuCTbUUp03Re2t62wqy9cG1ou4foBVAxKtxfMja+xYIvwQD+3V
 I+Ud1ByKcR7TMGyOsWnVlPGzBEN+nSkN/Ozsloq9ocDxP8a8XjAyrVOVUXjQnPzdHlfi
 JgRg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzwpvifLDWB3qdk+mKxG6jzP/zz3l63BMfao4Qj/BVYY9zW9UGDO+llnF8R6HIVDv9A0CVPMBClykbx@nongnu.org
X-Gm-Message-State: AFuF++lUa+Ce9hgluDw7nCaWGhLos8OiTU7Ube6ZYyG77jSTvbV9fD8X
 pxTlRZE2Qn4f89Qa1hBVSBLM4MunzQ1nE2V3LAsg6M6mk+pex5OvvmMXirk17iHf9Xg+BkGJY9S
 RiyvPeWZgjg8X/+uRRlfDffZhZjg0bNJyiRGU7lRgT6FW4J0HpUN8K5yzhA==
X-Gm-Gg: AYBFou0T71GTneNcnckbuA6rj1kRss0XCRxIUOC+ClRi9tMMqGt2cOTTY4TU1cdD971
 hoV4VKFltF3I+RuGeEZsMNst+XqPiE1LyyouNeqrq4spI55z6ncajWByqNmVPfBdSYrRpBs/tGq
 6o3hNT8U/sGbeLYa3eCMqrcjoERjawYPNkHg3ZBLzk/XZAB/rM3OpEocouKfYIWNbb9Z5hQgU2i
 Eu4U7Ytz3S3hzQV60eWmQdaCJXN8KJnjqk3f9iFI7BnbqUKVcvwZCireEMax1ygJw00ToQ9KT0p
 JHMIf6XPA0iV+PSnWEhEhavN+TPjTRiavVdT4ojbICgzs8/joGTFUqz+xowJwo4lZEcEHT1g060
 cA6iWCMIffCEvW2rHhYQfTa5SM6EA6xxbXg==
X-Received: by 2002:ac8:5a51:0:b0:533:228a:1cd2 with SMTP id
 d75a77b69052e-53374258184mr79897351cf.15.1790847280592; 
 Thu, 01 Oct 2026 02:34:40 -0700 (PDT)
X-Received: by 2002:ac8:5a51:0:b0:533:228a:1cd2 with SMTP id
 d75a77b69052e-53374258184mr79896921cf.15.1790847279990; 
 Thu, 01 Oct 2026 02:34:39 -0700 (PDT)
Received: from [192.168.68.100] ([187.10.234.20])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53385f7c74asm16242471cf.1.2026.10.01.02.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 02:34:39 -0700 (PDT)
Message-ID: <2bc44463-2a86-4e49-bac1-6286a0cdc9c2@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 06:34:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/kvm: Reset vCPU on VM reset via
 MP_STATE_INIT_RECEIVED
To: Wang Yechao <wang.yechao255@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20260930093940.117729-1-wang.yechao255@zte.com.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260930093940.117729-1-wang.yechao255@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe2931 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=jbqyKmyYbxlRs/MVMa3Ccg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=S796rhnvKvYWZhZiP70A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfXxuMc0vhwH9bB
 1Qr1W4V3dLsKHrCHbMglkmlJ86uEHIPNLTFvxn3abbeFxUleAi6Oggk9ayHV9tOBc0Sycn40/5G
 cbYapZMqykkwbt0UZsWNbTGsyXKqHP0=
X-Proofpoint-GUID: ljEeKd3HZHHBPP-pobzPjxMTgo7iDo6y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX+f9QPtUsQNPA
 +7L/2m0+zk1X1m9L9TBgksCHvwW8Y4Tb+BiOEa0x/W2FuWl3AnoT35VQph36U4rBZmFPfNjP2mU
 cgl+I/KYTyqj18DdlqKUt8ZNK09/4j26vAdqSO8hperJHJvZIKMmQifRMRYitu2geNrj7vkDt+k
 vaBZTrYD/G30GR3DQhEl+tI4w1LynXgcWvfl+MaPw5zaBsw+AzvCMhNBDF43srN16MdnTtFdXo5
 +PIlkiiMiHhEj99WmFAZ5c4nXt1acoRA+lpJTGV63PPTQdCtqbIRpXoALp9q6Cjqz8X7Od3m3GE
 ySc1T6JwrxcPb00DMx+IcnoIHC0iLD3ILLP9HkXXyYtQXaM8H2u2r1lBVBJmYrxb1GPwNr++zmU
 uCtYeoYOrf4jF+8ZdewEvep9kJt4rLal86rB1qi1JImo155102kMBm78/Epk7opIO9Qz/2OvB4D
 tFjU2hAzheKkGJE8AeQ==
X-Proofpoint-ORIG-GUID: ljEeKd3HZHHBPP-pobzPjxMTgo7iDo6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038
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



On 9/30/2026 6:39 AM, Wang Yechao wrote:
> When a VM reset is requested, KVM needs to reset the register state of
> the vCPUs. Without this, stale KVM-internal vCPU state (such as the SBI
> STA shared memory address) is preserved across the reset, which can
> cause KVM to keep writing steal-time data to an address that now belongs
> to firmware code, corrupting it.
> 
> Add support for the KVM_CAP_RISCV_MP_STATE_RESET capability. When
> enabled, QEMU resets the vCPU by setting MP_STATE_INIT_RECEIVED through
> the KVM_SET_MP_STATE ioctl during the KVM_PUT_RESET_STATE phase of
> kvm_arch_put_registers(). KVM performs the register reset while
> preserving the original MP_STATE, so no state restoration is needed on
> the QEMU side.
> 
> This reset path is reached both when the guest initiates an SBI system
> reset and when userspace (e.g. the QEMU monitor) requests a VM reset,
> covering both reboot scenarios.
> 
> The capability is optional and only activated if the host kernel
> advertises KVM_CAP_RISCV_MP_STATE_RESET, ensuring backward compatibility
> with older kernels.
> 
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/kvm/kvm-cpu.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 68e1501b21..30cea19dea 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -58,6 +58,7 @@ void riscv_kvm_aplic_request(void *opaque, int irq, int level)
>   }
>   
>   static bool cap_has_mp_state;
> +static bool mp_state_reset;
>   
>   #define KVM_RISCV_REG_ID_U32(type, idx) (KVM_REG_RISCV | KVM_REG_SIZE_U32 | \
>                                            type | idx)
> @@ -1405,10 +1406,31 @@ static int kvm_riscv_put_mp_state(CPUState *cs)
>       return kvm_vcpu_ioctl(cs, KVM_SET_MP_STATE, &mp_state);
>   }
>   
> +static int kvm_riscv_mp_state_init_received(CPUState *cs)
> +{
> +    struct kvm_mp_state mp_state = {
> +        .mp_state = KVM_MP_STATE_INIT_RECEIVED,
> +    };
> +
> +    if (!cap_has_mp_state || !mp_state_reset) {
> +        return 0;
> +    }
> +
> +    /* Let KVM resets the VCPU, The original MP_STATE is preserved*/
> +    return kvm_vcpu_ioctl(cs, KVM_SET_MP_STATE, &mp_state);
> +}
> +
>   int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
>   {
>       int ret = 0;
>   
> +    if (KVM_PUT_RESET_STATE == level) {
> +        ret = kvm_riscv_mp_state_init_received(cs);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
>       ret = kvm_riscv_put_regs_core(cs);
>       if (ret) {
>           return ret;
> @@ -1585,6 +1607,11 @@ int kvm_arch_get_default_type(MachineState *ms)
>   int kvm_arch_init(MachineState *ms, KVMState *s)
>   {
>       cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
> +
> +    if (cap_has_mp_state) {
> +        mp_state_reset = !kvm_vm_enable_cap(s, KVM_CAP_RISCV_MP_STATE_RESET, 0);
> +    }
> +
>       return 0;
>   }
>   


