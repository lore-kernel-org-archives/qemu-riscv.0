Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8903606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 19:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NM0eKsZH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3mpIygu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKKgb-0001N6-MP; Fri, 23 Oct 2026 15:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKKgY-0001MV-Bi
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 15:12:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKKgW-0001aq-Iy
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 15:12:14 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NIZmEP3584820
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 19:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EgX5xS0Uwf9Zi74wj+cU1i9EJvzf5UHbErqmdcMLpUw=; b=NM0eKsZHLrBu4bpl
 whWuMPtSluhnkbdxKUJeWRfWFsgX2QZwTqIqLwN5BLTQmidyENyx49FwLXNc1kgW
 /ONtK86bb0L+1F+QOuk/bWZB5aZSzWbcKszIeNqICjHY77TJVA6P9BQwWG1P+Srg
 z5lUnJOf/TqjlX6lpLQ3oKhtLxTSK6mMpFPheU7uKDEdJKWcfGgu5/BOzfcKWB8o
 44vDg/1XSp88ifUne55OwSSlqTkzUnuxwQtyHjAEb5CqwDquW3FEyXnQnqHN2Y7n
 HFyyzhRUZpMqhQ/IU1myScXNEwPiZeir4z7OdVhm0eq0Rn4mx+2mjXaD8SX0qUaO
 A0tzfg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn1hm7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 19:12:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91bc57d4d11so30840236d6.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792782730; x=1793387530; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EgX5xS0Uwf9Zi74wj+cU1i9EJvzf5UHbErqmdcMLpUw=;
 b=A3mpIyguEJX8SoWJxAMNNqUfambw/bBqUsjCvp1g74dyczg7xKN6LXHJ/U+0eHs22u
 rhDxZk9qf4AOkL4ppl939m9PdCaPlQTyKCOXFTGBZRe2fqLqtWz4trzxALn7q9AeoA1k
 hr6FJWALJNjbJSCmuOs57zOfgwGAoyVEiBE+7rlUFsIwosdjl4wuuU6L3OnSZEa5yVI9
 ylahO7UYf74gu4xxYKOmyUck5xpmwg7yw0OT5sn9V/Tkb7R7eYEvLQh3apjf4sMxHI8u
 7XrhVo7q9c055WOGasd5OMu9p75W4zncTAGXWiJ9Ltbx5Ayce9ZFYb8QQwGlLqATzMzq
 xnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792782730; x=1793387530;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EgX5xS0Uwf9Zi74wj+cU1i9EJvzf5UHbErqmdcMLpUw=;
 b=oGJe9fUTLmAq9F7OP6FmxPlOAGYCxVG0HhehUQ9yawSTyckCB0U8YDMMHo1L4+CPGI
 6TNEI0/t3wDF4RyFI7ZZ0xSv2bN4YzmRCe2G+lQcLhQVF8SR2r0Any1naVUnv/N612lC
 t84IFJaYBBwbP/JhASH4cini37OJwSQr9sxM+0sR+X6rMwmlWb/Qoa6Fh631GHBee+4/
 i8OI0L9B+0oRQy07gNma48h0Og6urt74dQra+V9fm/Fjb3Dx/not0nmzJMGurRvaa7Bf
 9zAwCNbl9RacEh5r+zB6dQpvFzQYqDK11nDrLLAlqVxP7F0YJYIvq8tYVanwcvbjTFYA
 Ytpw==
X-Gm-Message-State: AFq9FYJsBFUs78dcRzYxz/JvBEdnL4Xqxt6oQMrnKU3osX/WqUI3egTq
 b6JkGFyHYHzRyKKlLt5tM8wmOk+Z87JkH1S9ot0IUOjzrK0MEXqNw3Uj3/bfrgsRtTJ3PKLtYmv
 tM9Lm0iBGyYFe8465Lj8/09CBrUTJOhrrkw1e0WDtIH4xRYflcvhpbqmaUA==
X-Gm-Gg: AYBFou0od9Dodt7XTclPixZERrZiRIwETy98E/NA4EzdxKo19uDk9mxJHQvPTpMsNHv
 YRpnpEWQVgxcvL+J7voqGMUNOE4tNNmhglMNrunF57ufHR0tWg4nOhLWERPi2/rWvJfP1gR/Ckj
 1byA+o9vbwaP1nfDksGGVtQUthD2NirRj5+F7fXJpJnDj7ibrxyVHdjPwyIptkEqaph74mfjW1h
 6voZj14MQbqKCTxyxGvB6zv7ZCT7SAItYC1WjR6Ah9fRCMgkCTPrZJoXDu8TslCNpIBQsEMZ8WJ
 2nQ1YZ7szlKQSRODgzf3a0xRLeB00/9HW2jgbhqkSljvaElgRzn7fBjz07sB0ad6A69eGvDkJIP
 gOf4TRzZkXtvxrAXZW2qx+oPIoWtWOHTBt4UC
X-Received: by 2002:a05:6214:da5:b0:91b:90a2:df1f with SMTP id
 6a1803df08f44-91c3aa06c2bmr47221896d6.49.1792782729890; 
 Fri, 23 Oct 2026 12:12:09 -0700 (PDT)
X-Received: by 2002:a05:6214:da5:b0:91b:90a2:df1f with SMTP id
 6a1803df08f44-91c3aa06c2bmr47221496d6.49.1792782729333; 
 Fri, 23 Oct 2026 12:12:09 -0700 (PDT)
Received: from [192.168.68.104] ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47a7cd7esm2521466d6.2.2026.10.23.12.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2026 12:12:08 -0700 (PDT)
Message-ID: <fa0fb912-d470-42b5-b029-b3b8680dc8fe@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:12:05 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] target/riscv/kvm: create kvm_riscv_aia_access_reg
To: Wang Yechao <wang.yechao255@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Xuemei Liu <liu.xuemei1@zte.com.cn>
References: <20261023021237.486091-1-wang.yechao255@zte.com.cn>
 <20261023021237.486091-2-wang.yechao255@zte.com.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261023021237.486091-2-wang.yechao255@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfX7o2VcaLt+J9+
 qQWmgGFyWijtJ+y7KFj013EzgeCJMJpboUguJrOwI26efA/ktcZlrTJ+L3ujlpBjbVIuwXlbZgj
 1wYSHGEvfjHGjFqVqPfftQLbq0mNJRWyqrL9QI0X6uh3LqmzpmyGar/5ondpEaOKvtfAur58R61
 8Y1HnQuHpNIiK9dilGcsKnUYMo9OLnohpe4oqHxbFTu0K1HGTOSbXbonUo9ZopiL9wLfuYLr577
 G9ot47z2ICfeOpjXKtDDZZ55BMH7e+kXNLHBneMP+Gzppu5fsyVD7jAwxGOGHHXTMilQKV4fTzL
 LoUBzmC3N2DFofheqXi8gky65sCVzP2uYvo08EDiMKQbWm/+/a9bf/ZdyZf2dyuqqkfiKm0fLrZ
 7GwMF5SnL2TOaYqry5SPE8//KWdFB/P34MZjODvU0iyaNh3MqJ2JIv7IcanDsgR6zLdJF0ltoMv
 gsze4NX2+UqC/ns3oXw==
X-Proofpoint-GUID: 3yVrT7pl1hK-wUAMPHXjuJwFBQAqb1mV
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adbb18a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=MIYIJ5hYJWVnXa0tc0AA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: 3yVrT7pl1hK-wUAMPHXjuJwFBQAqb1mV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfXxA+HVs6JZA5E
 tzSfmDDYezwK4S0kNjOQ1ze1F3PjxkdXCStzKbnqEcPr+6zjGclHpktsr1R4vy71MUBIhfIyw6q
 Dh6sjcimVirjvRbcSJKm1hDbC7fkgyg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230075
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



On 10/22/2026 11:12 PM, Wang Yechao wrote:
> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
> 
> Create common function kvm_riscv_aia_access_reg to access APLIC
> and IMSIC regs
> 
> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/kvm/kvm-cpu.c   | 7 ++++++-
>   target/riscv/kvm/kvm_riscv.h | 1 +
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c085b22b23..3ed94f7586 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -58,6 +58,7 @@ void riscv_kvm_aplic_request(void *opaque, int irq, int level)
>   
>   static bool cap_has_mp_state;
>   static bool mp_state_reset;
> +static int aia_fd = -1;
>   
>   #define KVM_RISCV_REG_ID_U32(type, idx) (KVM_REG_RISCV | KVM_REG_SIZE_U32 | \
>                                            type | idx)
> @@ -1924,13 +1925,17 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
>                                       "auto");
>   }
>   
> +void kvm_riscv_aia_access_reg(int group, uint64_t addr, void *val, bool write)
> +{
> +    kvm_device_access(aia_fd, group, addr, val, write, &error_abort);
> +}
> +
>   void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                             uint64_t aia_irq_num, uint64_t aia_msi_num,
>                             uint64_t aplic_base, uint64_t imsic_base,
>                             uint64_t guest_num)
>   {
>       int ret, i;
> -    int aia_fd = -1;
>       uint64_t default_aia_mode;
>       uint64_t socket_count = riscv_socket_count(machine);
>       uint64_t max_hart_per_socket = 0;
> diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
> index aef681f0a2..8649219e0e 100644
> --- a/target/riscv/kvm/kvm_riscv.h
> +++ b/target/riscv/kvm/kvm_riscv.h
> @@ -29,6 +29,7 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>    * @level: %0 to clear the interrupt, non-zero to set it.
>    */
>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> +void kvm_riscv_aia_access_reg(int group, uint64_t addr, void *val, bool write);
>   void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                             uint64_t aia_irq_num, uint64_t aia_msi_num,
>                             uint64_t aplic_base, uint64_t imsic_base,


