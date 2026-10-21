Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54AD606A319
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 18:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JQ5/coz4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLUDxkSP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJayc-0005oG-Nj; Wed, 21 Oct 2026 14:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJayb-0005ny-Kr
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:23:49 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJaya-0000e6-0d
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:23:49 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LHpIZS790725
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V0rwOne78GCz/YC00rgYJYVTVDvpgUtAJsa8hN2K1Lo=; b=JQ5/coz4UdubbX0H
 0ooTH3rgTHDNSVeWogLPVzspogFSt7U77pmE+HmsF7u5N3fuvTwEWKSTVuIw5Al9
 NzzF5QW1Sfqtaf7Jp6GtlSS7ffv6nJEZ2vmG6UH3TBCXYyXbUyp4L+NjnHgoEwIU
 MgVPlry62dL8hBwhulJdIknbjQQwPV3zJ0l0AI7WKbrsZVmxNpa/G7wBd/3EWvAL
 gyjuwUaJvt5iwOMziP0IOiqJA9GKLoHKSB+xpMc+wYF8yzL/m8IjIGSEhnKVeG6W
 BFCL/WOxYd8Te8nIBoKS66i0+lgZYnsMGCuNaxuXoX7gxmS6TgpkGs8GGoghnbFr
 gWw1VA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv0p75-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:23:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f1e62510cso241351085a.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 11:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792607024; x=1793211824; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=V0rwOne78GCz/YC00rgYJYVTVDvpgUtAJsa8hN2K1Lo=;
 b=jLUDxkSPlV/SgoRm2x0hbdwzQBlHzSejt6/GG5iRdHwQmttdOtuBulbcvqn5kf2ec9
 dFb7lYtMCfwRPdMAEXK0Vf+zYKsufsz0g2E+CqkBV/RDSkpAfFp2X8yU/KcavBK6J5cK
 ct6swu8Zikdi4yKfK4h6DnPd9CAqvnsm4gzgmFj8TdEOoaWpPa10HEGhqTKcGVhqWNK4
 jB7erVgH1WAgmYfoYY9SwVUBrd6GPRsxnA7h+HsC/93+MDMPP5aH6dDugkR3QEJpg6i4
 9JlW3AVU9WKaVLVKbuxhespaBFKt2zmH60dKxfG2bTpN4ryWXoi86uC4rQZkwyv5eX4i
 nCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792607024; x=1793211824;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V0rwOne78GCz/YC00rgYJYVTVDvpgUtAJsa8hN2K1Lo=;
 b=JolgO0+U8MiZtxY6KY2OLltgerGU3QAl/nVfkUbfXU2pvt9oL+8bO60R7WeNIc1lJp
 5G2NG111No9iB8Wr2oehD8qBpcuOOc1Kju7ufgqbNvBLGg9eCS1Utg/TzZPE51NrGyrA
 QpEBlz8etmugyOvIJttPMx2oynyN5Jn45c5UAX3MR8MrstyTZN+0REG3gb3MFA+jBjD1
 mo3CyFP7PGzunOHqiokKT7aILAeZl7G1km5wgRCbmrLDmqSQ9Z9tMc7bKhdgq+cKQZqp
 yDbn22ZBbc25clvB3j666VK6xF/E5c5QKY6981p56nqwkYwcTHFdmX5mN/eJuwZGxXtN
 TRoA==
X-Forwarded-Encrypted: i=1;
 AKwUvByq183/c3kDP3coG9gnZ1mEYp04dJbSobKitv1mdA4Ds7T/yYf2FnSzKGswARddHzu7Eup5igyuNv0s@nongnu.org
X-Gm-Message-State: AFq9FYKj9bCvpumJ94uQKHCqLTraksx1WZ12LzKOY8ALPk2ekRhAD+ji
 V0XaTxPKpZf5vld6wzLTDKC+IxQoRICj9mL8LbAj3MHx+qHlNdxqlerimY44MQ0uSfLp1lGpUFm
 ez6kAWo6o6G3MGs9y3FUxbAf3dSVvoQsvlRwIjJxP1ZgIzg4i4WwUcZkeOw==
X-Gm-Gg: AYBFou0MhseDJ0MOoA9cepUHqETzfw9pr67CAizelUx2DokwUQuuqHqmju56o3MZKb1
 fNin0zqkEJcmyGNYecZkEwiWqOdJwJBOnsxKowcNTOjcSW8zONYbzpGZz393R0+u5VElt4/WS8i
 R0YcsnweuQmvbBlKJTqF4tB6wZ1ZnPkQwGtiY+JSJ7qZ+KNLS0nPnjnVw1m3m10ZUITdSME74kX
 MtvTADp2yuko/cejOZ19J3V1qJKRavvOy/hD4D06HUJmNF0Uj7xDIyFu+Q2InRFgVMoQycD5Lvt
 SdAe/zT1K2udgf8iwgBWaxj3Zvi80Ux9uRZkScInadVCrpOdkCzKbAkakQesXTHF/nmptvZ1yMy
 eybqDArZJcJU4cUlNSYoxqAo9K3G29h9T8sD8HFZeulZ9BghSzNl3qyDGsUleGBdYjDTvS/P6
X-Received: by 2002:a05:620a:2a0b:b0:93e:94f2:ada9 with SMTP id
 af79cd13be357-93f57f79117mr582690485a.58.1792607023913; 
 Wed, 21 Oct 2026 11:23:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0b:b0:93e:94f2:ada9 with SMTP id
 af79cd13be357-93f57f79117mr582686785a.58.1792607023340; 
 Wed, 21 Oct 2026 11:23:43 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f56e0952asm312395585a.34.2026.10.21.11.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 11:23:42 -0700 (PDT)
Message-ID: <91d62753-5841-456b-9869-32b73a0ecbcc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:23:40 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: Add SBI STA state to vmstate
To: Wang Yechao <wang.yechao255@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20261017145211.219258-1-wang.yechao255@zte.com.cn>
 <20261017145211.219258-4-wang.yechao255@zte.com.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017145211.219258-4-wang.yechao255@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad90331 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1RTuLK3dAAAA:8 a=mdeikwMS5mDVz4aCriMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: q4SQt2DdxuLnLwj7AdXW9E7R35yfPq3K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MyBTYWx0ZWRfX6/TfxiyVqi9f
 /Haryugm0oADQpeo0MR9IvKqOSje4MGjycWs+Eab/JazCGPo0l3SOqbQ8tZ2zqg+un9AXUrA/PX
 Cx7lpTEhjqv6idrIlp2c/snLZmbQDdA=
X-Proofpoint-GUID: q4SQt2DdxuLnLwj7AdXW9E7R35yfPq3K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MyBTYWx0ZWRfXzrFQ/d1lbvWd
 eYTl42/RQgUjH9Gud0HGVr4o9qL0N1b057FbwOO4tJT/hs8finoS7pOAio54IOJHCK4gAkOn6yv
 VYjUTpm4z3jy6WyIgGCwvpjY0yGePRpxQTtYjBTg0SkQM+7d7Rpx9LhSRUjaWn7GtNbBBx9lfCo
 OZ24tU9qWldB3XOvbaCPURoBNBhgxPFbVNkfkgj+6wzGcSepraskoGpMNr/AoRxTCaJpDNkVghW
 lhqfN3koV1hk+b5m9imgTXRY39Q4ymY3my0GJRKu/xqu43w6ZLMfo9Ne0etbN3lgR4xKWq4/ViG
 g/jdyjIGOxPkvPuO5WuT7avx1FETfmyGfzMemNXzqBjZAVWTBsVO9lXUWSgCkSyyzUgm9RLfZjr
 vW5zQr1DyM/0wnZt5HlpHVHzebOqi68upKEvFdhlLQMk64djwvL3v/LlTyMoCsdtmOkzwlnZm0h
 hDR1r4ua8QlTKRFCOJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210073
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 10/17/2026 11:51 AM, Wang Yechao wrote:
> Save and restore the KVM SBI state as a vmstate subsection, so that
> a guest using SBI STA keeps working after live migration. Only the
> STA shmem address (shmem_lo and shmem_hi) is saved for now; other
> SBI state can be appended to kvm_sbi_state as it is added.
> 
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> ---
>   target/riscv/machine.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 0de06e9588..b8cdca79cc 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -318,6 +318,23 @@ static const VMStateDescription vmstate_kvm_mp_state = {
>           VMSTATE_END_OF_LIST()
>       }
>   };
> +
> +static bool kvm_sbi_state_needed(void *opaque)
> +{
> +    return kvm_enabled();
> +}

I think kvm_enabled() isn't enough here since there's no guarantee that
the current running kvm driver supports SBI STA.

If we take the existing mp_state as an example, in kvm-cpu.c we have:

bool kvm_riscv_has_mp_state(void)
{
     return cap_has_mp_state;
}

And then, in machine.c:

static bool kvm_mp_state_needed(void *opaque)
{
     return kvm_enabled() && kvm_riscv_has_mp_state();
}


I think we can do the same here.  In patch 1 you're setting kvm_sbi_sta.supported
to true if SBI STA is available.  We can add a:

bool kvm_riscv_has_sbi_sta_state(void)
{
     return kvm_sbi_sta.supported;
}

And then you can use it as another check in kvm_sbi_state_needed() too.


Thanks,
Daniel


> +
> +static const VMStateDescription vmstate_kvm_sbi_state = {
> +    .name = "cpu/kvm-sbi-state",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvm_sbi_state_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_sbi_sta.shmem_lo, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_sbi_sta.shmem_hi, RISCVCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
>   #endif
>   
>   static bool debug_needed(void *opaque)
> @@ -645,6 +662,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_kvm_timer_frequency,
>           &vmstate_kvmtimer,
>           &vmstate_kvm_mp_state,
> +        &vmstate_kvm_sbi_state,
>   #endif
>           &vmstate_envcfg,
>           &vmstate_debug,


