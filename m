Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2ECC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 10:53:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfbVP-0000r0-NR; Fri, 03 Jul 2026 06:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbVN-0000qC-Oq
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:52:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbVM-00017P-1Q
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:52:21 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6639Btw33694400
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 10:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0hx03ZTlsQroyRpYLDQt6RPjcH2dFopl7aH8+SODzlQ=; b=khLA4kDFfaDdhyxv
 MevfE2w2yCdWjVZwkFxQJAQP6A8bGN1gxitTdg0M+eGB1QpSbxG0EY9e0+5AaK0m
 cU4i4aYjfoZoEgY2MEYjnLY6noJic5nLNuGa9ZUba2IarsAIdv1U3npG5+llax9E
 Z61o/fTRezQz4+41pECpyMjaBImlRCocqxlq7iQTpL/Xw2BSk4tlB2Z7dAFqg+no
 9dYRA0AkmfFEztPZkk0GsX0MpH8zGejw57V+TvjbenSDr84EKyvGX+3Ynu3Av53k
 +YG9r3KArTMoVbu74aKWrkQeRdOBbr7Ve5L7Ut2B9UbWz3EEffd9K6F8sflr6JG6
 SFzZhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a848b5x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 10:52:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e52306621so32862985a.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 03:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783075937; x=1783680737; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0hx03ZTlsQroyRpYLDQt6RPjcH2dFopl7aH8+SODzlQ=;
 b=Ax800x5Rzx3XBKNTXwtdI7ghEDrgsWUkRPrlsWBeTjIabSK52M9R8Iw6VwzN214aMX
 GRBOUYMgY00kyzfakFwE6WmjsGHwUiiuH4KXeit6+f6+ytClMD3XoB8OI8Y+MvbfDu4Q
 2N1sJHzbwQ3ue/UxD3unBf+skWVZmr7z0PTtI8NRdhojhbTy8As0loRwZ2y5mBJ13Qdu
 tslFScu3RBc6PLxgaHJ2FvMcQBOfzjUbTJnlTPJZP75fiF1LXdOETadj9Orq2NOL6UBQ
 4XSU015btO0ml38FQHlzs2qeDiAcz1qI1gFgII71TEjc5I0WEG7HaxKNhw7JHUvRAeZG
 Yq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783075937; x=1783680737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0hx03ZTlsQroyRpYLDQt6RPjcH2dFopl7aH8+SODzlQ=;
 b=D83oYcXKdLfBCwPpTISbfQluqobYjoDx/TBkcem1qzNSInn9ubiLg9Pajcgt9r72Pt
 pwyw4odVMyq1EE1unWtpw/+5Ffhi98e1ujTJDWocWRH3kX1WZccL6GkPYIhG1ncDsVKY
 XdcF/s7HBlQDxDvNMJEfcJl9Ief6Rax1xtTmgO2hQe2+LnrjMz4ut/rvkx0rikaBbE4C
 8ucgwYu3sOcWsLcWXUGrb02p5u3i9lzDcaiR5Xuhjs020Oj9S9SdWGt4p51hylxk0wQC
 41bbQkP09appMgTSXXtUVcCCpF079B5vX1Bmep2nDHkfactqQjdC5Ge8gx4taCYcMRUM
 Ucfw==
X-Gm-Message-State: AOJu0YyjXzfqYOz14k32NGe+q9twSb5VBQkklmcPMVfTnfrWrCJlB+Rv
 Th65mFBPoP8uiWPCW5ViEEHSZXCFOG6DbAN/C39GRzdqFjJLsxD4IJBw6siJ1s/Py41jln83XVl
 8/an5uTy2qQkP5Pxhtk2f4F49aJ4p82T2AAOUk7C0rT0lZLAe3YlPjYFpwQ==
X-Gm-Gg: AfdE7ckjawhfTLJxYUBpdDU7KxNPliVML7pBNW0hInFs4soaUlXcimTwbp0Mqhj7bMV
 IMucwpSDTYRI6mVR9ZdPT/HWr0IqbWkFh8u6J0SgL/M2YKDXDAI/3WuW6TmJfsZoBzlyamu9IRz
 KAhtzKn5wE8D/Ub6tLvq30OgaxVhfYRdewuQqP/d4YcB1ZSi7dLq+klq7fQOmnWhrXKn4WXp0qT
 ThdE7cTeZcxRG2s+xo8ZpnG1RMlMhjdrE3zjWlrlHKFWBTmimGFyijhzXMV/WKo3l7uY1zYJTHy
 0wIYPatUOYHUA067diz1kQ7Fag3ZxvabVYlpZqXyDcphSoKwnFZrse/m7eYwlSDLT++wMygpNSi
 +EaoYQtfa0PSypML3rLd7XDalfHQZc1IG5EVqRnchOhM5zc0grvYt9db3gK1lpw==
X-Received: by 2002:a05:620a:1a22:b0:92e:4dd2:bb24 with SMTP id
 af79cd13be357-92e784d10d5mr1269974785a.39.1783075936729; 
 Fri, 03 Jul 2026 03:52:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:92e:4dd2:bb24 with SMTP id
 af79cd13be357-92e784d10d5mr1269972185a.39.1783075936182; 
 Fri, 03 Jul 2026 03:52:16 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba97csm122391185e9.12.2026.07.03.03.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 03:52:15 -0700 (PDT)
Message-ID: <34076b45-fbb7-4b08-8a6c-04b903d3e2d1@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/24] target/riscv/gdbstub.c: isolate TCG only checks
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-20-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-20-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v_XCQBYGHpiuO-Lbqn20GJeqToLk4L7s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfXxr3kHhTCSjeJ
 Zi9abQe0X4LwfYE3IKa4n9ivrS9SuvZgYnFw6v80BYIraB4V6hpC/TwJLeZUuUXnJDXAWZLiN9K
 kmZwBby+woTD9Ir6Afq4NnVrYVgWfuE=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a479461 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=5xwS0rAgYOzje1glQ3AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX6abQvKqatk5d
 rGGgCvNgrspc7hpRKdn+0jbcP71HHiuu9JnRZMXxvJ7MJVCiToaAu9cDOi4BAVG9FfbA0M/gXSu
 MAiPbIQjLLJOuc/7bWP85IyvTOvvnZSecUgd+F8EF+K+kJDYWJLrXGlDHk5c5o/8jMj5JhZIqRp
 nEA898J3AK4SPYyZsLYPm+WiyN211BpZD4rJ1tng3bSq8q6ogVr7ySJQ6fUesyKVbe4Ezqd+ZFm
 gNg1Pc9mnlahGd32Mr1bbpFBa609OPy36PU0gDAZFm1/TR3UC2uNx85Y6lHCDnnUVy2c4RMaRzy
 pOCM1EH+AFoEnefrAmm7RrfIDF0IKxn7PlucfCWDqCRy1KnCSagmWzw3eAapZVrfKsudCPoveWk
 nfP00ss/bo9HI6k2ud2FNrzTbCarM9GWtH0Mr9upK8sA6abEe2uIPA0GsYRWWkTZALAwCn5mb3l
 ucyEzp6YqJzDb0XHIGQ==
X-Proofpoint-ORIG-GUID: v_XCQBYGHpiuO-Lbqn20GJeqToLk4L7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030105
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 2/7/26 15:51, Daniel Henrique Barboza wrote:
> The following functions are TCG only and are broken, if they were ever
> usable in the first place, with KVM:
> 
> - riscv_gdb_(get|se)t_csr
> - riscv_gdb_(get|set)_virtual
> - riscv_gen_dynamic_csr_feature
> 
> Gate everything with TCG enabled to at least get them out of the way to
> enable --disable-tcg.
> 
> As a note for the future: other archs have distincts gdbstub files for
> each accelerator.  There's a strong case for RISC-V to do the same.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/gdbstub.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index f0a5e0d86f..9abbf5bcdf 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -164,6 +164,7 @@ static int riscv_gdb_set_vector(CPUState *cs, uint8_t *mem_buf, int n)
>       return 0;
>   }
>   
> +#ifdef CONFIG_TCG
>   static int riscv_gdb_get_csr(CPUState *cs, GByteArray *buf, int n)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cs);
> @@ -294,6 +295,7 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
>   
>       return &cpu->dyn_csr_feature;
>   }
> +#endif /* CONFIG_TCG */
>   
>   static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
>   {
> @@ -336,7 +338,6 @@ static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
>   
>   void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>   {
> -    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
>       if (env->misa_ext & RVD) {
> @@ -351,6 +352,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>                                    riscv_gdb_set_vector,
>                                    ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs));
>       }
> +
> +#ifdef CONFIG_TCG
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
> +
>       switch (mcc->def->misa_mxl_max) {
>       case MXL_RV32:
>           gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
> @@ -371,4 +376,5 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>           gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
>                                    riscv_gen_dynamic_csr_feature(cs, cs->gdb_num_regs));
>       }

I wonder if it wouldn't be safer to extract as a new
riscv_cpu_register_tcg_gdb_regs_for_features(); but indeed moving
the TCG specific code to a new target/riscv/gdb/gdbstub.c is even
cleaner. Can be done later surely:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +#endif
>   }


