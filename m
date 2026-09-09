Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A92C79FB6
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 19:58:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4ORF-00072T-0o; Wed, 09 Sep 2026 15:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4ORC-00072A-VV
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 15:58:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4ORA-0004sV-M5
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 15:58:30 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689JIa7o3219929
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 19:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Dz+KcoemXTPN9JdbIWJEAXWTYp1rEG+qsojjeqnDMBU=; b=QZVjAEY5SVUmp6/o
 lQdzHxIhgrQbQZezzhSIKcWO1wtsor/vOEmAx+SudXDvohT77DZbBz+vaVqvH0AJ
 BE4Keq60JziNDxLb4cqsF9TZFZioGoYvHc+YNOELpZqwJ0yz4lyO2A6XswkVP9yT
 TCe+8I9j52BrjBOq1FrpnzzwgldBhZIdOnqUGzQjkCMvKv1dxtp6+lIdfoP9DB7M
 dtwL9lyFJfgPDNW+H5JmkUbXJGb26btM1WYjWhp+5/ViEDO/kc207sMvtdlbausC
 jD1TniGYXZPjidk0y/LDsY5xgMyNDrhLqDFut9z/a7Jsdlw3jsxFqmRUFlvlJqOP
 +R15tA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg09xk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 19:58:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-939a6937513so487006285a.3
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 12:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788983907; x=1789588707; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Dz+KcoemXTPN9JdbIWJEAXWTYp1rEG+qsojjeqnDMBU=;
 b=BFBC+iPcANXHQ0Ia2VFXNUH0XNSPq47ghV9cymqNoWYth0k3FQLaQ2JpvvGF9QbwIP
 jfknCSzH6rpZ1SInsmpUzp4E5w7oVO3rZRFfRMnzVJDT2Q1G5KOAhkOw1ubFzUAx6MLs
 HWk4sWLMf0qS7PulOqWbCkHuIn46GRmSBF8eMZQ65kVmNHeSslBJS/BXSlCEJjPzpUau
 h3hzBGhaknaPI4Z7CsmoqsuEjUplF5zrDg4Vz9dyNJSPqey7mI9Ejn0yopsRUjglrN+W
 sQGN5cjFcf+3/BXe2dWqS5Jj78I4UPawlft/uySGjF25mcB4B+4bSva+lZ4UYBmHi+D1
 C3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788983907; x=1789588707;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Dz+KcoemXTPN9JdbIWJEAXWTYp1rEG+qsojjeqnDMBU=;
 b=IHutZsKOpOAEwDv+FIHo6HQcL3KzDuUAvS1lAs06qrQ5SlK0rlRuXMoWQ4WifcoEwR
 UHl02vY0K3TxsU2funJ2DpzUONOn2dfEOxUeIru8IvLDy2IygW4ps7xjf3AyRRJ7Ys6z
 2qOBKv7/FWtQ8QlCSK13+4vl4/zSGl9whWqhV27kp3hhjpWMMiKGqIQNBCLMW7Gh/AkH
 Ns+vNomDNp6DaIadNeNv+L+bAf/C7Lq27TZVEQy4nZvAM97sBF24HsA7F1UzAps5bOr0
 jYhw+55PVl8+VqdGpHswjHtCMU7qQLgLghfnIhnez/668UgGf3Pm3kaL8qmcL2Lqn/zg
 Z9wg==
X-Gm-Message-State: AFuF++kHdZ1PQB6XH3R0oZYWH1cqJkJX/ie/juaPeA2hKnMpKXCPkmqF
 jShiPXmzfj/eydEER7432AM2EULV1k4cCeUK04efswJppkh6qn2aoxqNoAkp5hv2P9+ncWT/LzR
 wO1ojVqDsZ5m/0BVvelDvHtwL58Dv3jfvomJ30Abu1Zkj00pJefL6dLkTUA==
X-Gm-Gg: AYBFou1gFb1btsMkVVwAHUNpLgkEG0nGWm4adAztmE4qX8JmF/QHraJABaebeFVMir1
 mCy79M5GV4CB9xtjEMsNz8PwKUVcS2OpJED0Kj7ZeepmE9v9h6SF9yMOSGwOvc63UMcd/FkUy5R
 F7mYhSTF9iOigA3aOt/8sKxWLM7etGwOu2Ry2XoSIoRlp4U6FICQPKvrakFYoiuL8jOQE7cPdWC
 jGbgvwvFJscJgOtRevZHLhBtzL5bYDHHcr1UdBJxDD1l+Rx/SRKzadSMM/74Y1Av+FdO7NwoAkA
 hJGFibfkfMrAMYqLp6eOiaDureOZkTaYOEP6bYj4jKJcIgY9215GQFH/ugbaI83Oo11vxdvZRJs
 AhINF8jljOGe0D5VWTUzjuJhoH8Ii6av9cp8=
X-Received: by 2002:a05:620a:8083:b0:939:6dea:374c with SMTP id
 af79cd13be357-939804f9df1mr307236885a.48.1788983901629; 
 Wed, 09 Sep 2026 12:58:21 -0700 (PDT)
X-Received: by 2002:a05:620a:8083:b0:939:6dea:374c with SMTP id
 af79cd13be357-939804f9df1mr307232585a.48.1788983901017; 
 Wed, 09 Sep 2026 12:58:21 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93982db6a95sm1420643185a.9.2026.09.09.12.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 12:58:20 -0700 (PDT)
Message-ID: <a1d674c5-1604-44a9-b745-0fbaa7adf339@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 16:58:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: fix RV32 fixed counter accesses
To: Zephyr Li <fritchleybohrer@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-stable@nongnu.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, alex.bennee@linaro.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
References: <20260909072356.42784-1-fritchleybohrer@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260909072356.42784-1-fritchleybohrer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa1ba63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=68JtqRz0_O9y8ZoiFMkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIyMiBTYWx0ZWRfX+8ohm1ka1hvX
 KwnIkg/lq85z6tq4P6Y2VJcU6hM1cQYZz5SMBVZqXsqTBs++Hn+28AGrHACYw/EK1yNbXtSJP53
 kT00aa/4LYaNEMFj++9gSS5mI7oY6uo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIyMiBTYWx0ZWRfX4SWd1O4e9NXM
 K3WlR4e7pOZfTAnKQEL9nkQ116s3UeFcIQ0rg06A0yDnbTcoooC8eqbOU7TqoTMDrjb7iDpQME1
 AKD6Uipa/BqmZTujNdHN3JZjz3RKRagOdY9Q72FmPHMfZu6h9U9H+BTiKNS6cJ+Z09Tme8mh/Pf
 +gs+iG8E7KAQVgGhl08exMzFTf4uoRHhnNPBftUJMmpCggg8gIAesEWTrzJP+dWvHrX0XcbcQyr
 oxOFwjJJWSLLw+PwY9TldrbCOPiaiLhevDnJR/5gSt0SXaJq0R55Jr4JCpHPvvIUToCO5JzgDOh
 V4qDvMpcLLO0QQQ+GxrRCapimKevfCPLJA9oWaiz/iZIXNCyX4HuapTxGeApueSrZ+wuyYad2+v
 oIlbscBkSQAkx8jZWcGq16AC5GNIgftpA34OzDkif2WnyC/0bEaTGEKUI4ZNYAv/bl/4PYGxwon
 JIS02PQvntYCgc2yw7w==
X-Proofpoint-GUID: PuAhY0Q54oghbt4BLpfKwyQKAC4_pfr4
X-Proofpoint-ORIG-GUID: PuAhY0Q54oghbt4BLpfKwyQKAC4_pfr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090222
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 9/9/2026 4:23 AM, Zephyr Li wrote:
> Since commit cfc96df65e01, riscv_pmu_ctr_get_fixed_counters_val()
> returns the complete 64-bit fixed-counter value. The RV32 counter
> access paths, however, still perform parts of the offset calculation
> on separately extracted 32-bit halves.
> 
> In particular, riscv_pmu_write_ctrh() deposits the low 32 bits of the
> complete fixed-counter value into the high half of mhpmcounter_prev.
> riscv_pmu_read_ctr() also subtracts a 32-bit half of the previous value
> from the complete 64-bit fixed-counter value. Consequently, writes to
> mcycleh can be lost and carries between the low and high halves are not
> handled correctly.
> 
> Keep the fixed-counter offset calculation entirely in 64 bits. Before
> a running counter is partially written, materialize its current
> architectural value and reset the fixed-counter baseline. On reads,
> calculate the complete 64-bit counter value before extracting the half
> requested by RV32.
> 
> Register RV32 system TCG tests with the Meson build. Add a test for
> high-half writes, low-to-high carry, and preserving the carried high
> half across a subsequent low-half write.
> 
> Fixes: cfc96df65e01 ("target/riscv: Remove upper_half from riscv_pmu_ctr_get_fixed_counters_val")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4219
> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
> 
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>


And thanks for creating the meson scaffolding for riscv32 tcg tests.

Cheers,
Daniel

> Changes in v2:
> - Move the test to a new tests/tcg/riscv32 directory.
> - Convert the test registration to the Meson TCG test framework.
> - Add RV32 TCG cross-compiler options and cover the test directory in
>    MAINTAINERS.
> - Add a riscv32-local semihosting linker script.
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7183babd6a..5f75b2684f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -377,6 +377,7 @@ F: include/hw/riscv/
>   F: common-user/host/riscv*
>   F: tests/functional/riscv32
>   F: tests/functional/riscv64
> +F: tests/tcg/riscv32/
>   F: tests/tcg/riscv64/
>   F: tests/qtest/iommu-riscv-test.c
>   
> diff --git a/meson_options.txt b/meson_options.txt
> index 292625af08..2ceebe7a44 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -452,6 +452,10 @@ option('tcg_tests_cross_cc_ppc64le', type: 'string',
>          description: 'cc for ppc64le tcg tests')
>   option('tcg_tests_cross_cflags_ppc64le', type: 'string',
>          description: 'cflags for ppc64le tcg tests')
> +option('tcg_tests_cross_cc_riscv32', type: 'string',
> +       description: 'cc for riscv32 tcg tests')
> +option('tcg_tests_cross_cflags_riscv32', type: 'string',
> +       description: 'cflags for riscv32 tcg tests')
>   option('tcg_tests_cross_cc_riscv64', type: 'string',
>          description: 'cc for riscv64 tcg tests')
>   option('tcg_tests_cross_cflags_riscv64', type: 'string',
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index bd4b6dc114..65985efb22 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -1337,23 +1337,23 @@ static RISCVException riscv_pmu_write_ctr(CPURISCVState *env, target_ulong val,
>       int deposit_size = rv32 ? 32 : 64;
>       uint64_t ctr;
>   
> -    counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
> -                                         0, deposit_size, val);
> -
>       if (!get_field(env->mcountinhibit, BIT(ctr_idx)) &&
>           (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>            riscv_pmu_ctr_monitor_instructions(env, ctr_idx))) {
>           ctr = riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx);
> -        counter->mhpmcounter_prev = deposit64(counter->mhpmcounter_prev,
> -                                              0, deposit_size, ctr);
> +        counter->mhpmcounter_val += ctr - counter->mhpmcounter_prev;
> +        counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
> +                                             0, deposit_size, val);
> +        counter->mhpmcounter_prev = ctr;
>           if (ctr_idx > 2) {
>               riscv_pmu_setup_timer(env, counter->mhpmcounter_val, ctr_idx);
>           }
>        } else {
> +        counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
> +                                             0, deposit_size, val);
>           /* Other counters can keep incrementing from the given value */
>           counter->mhpmcounter_prev = deposit64(counter->mhpmcounter_prev,
>                                                 0, deposit_size, val);
> -
>       }
>   
>       return RISCV_EXCP_NONE;
> @@ -1363,20 +1363,22 @@ static RISCVException riscv_pmu_write_ctrh(CPURISCVState *env, target_ulong val,
>                                             uint32_t ctr_idx)
>   {
>       PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> -    uint64_t ctrh;
> +    uint64_t ctr;
>   
> -    counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
> -                                         32, 32, val);
>       if (!get_field(env->mcountinhibit, BIT(ctr_idx)) &&
>           (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>            riscv_pmu_ctr_monitor_instructions(env, ctr_idx))) {
> -        ctrh = riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx);
> -        counter->mhpmcounter_prev = deposit64(counter->mhpmcounter_prev,
> -                                              32, 32, ctrh);
> +        ctr = riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx);
> +        counter->mhpmcounter_val += ctr - counter->mhpmcounter_prev;
> +        counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
> +                                             32, 32, val);
> +        counter->mhpmcounter_prev = ctr;
>           if (ctr_idx > 2) {
>               riscv_pmu_setup_timer(env, counter->mhpmcounter_val, ctr_idx);
>           }
>       } else {
> +        counter->mhpmcounter_val = deposit64(counter->mhpmcounter_val,
> +                                             32, 32, val);
>           counter->mhpmcounter_prev = deposit64(counter->mhpmcounter_prev,
>                                                 32, 32, val);
>       }
> @@ -1407,12 +1409,11 @@ RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
>       bool rv32 = riscv_cpu_mxl(env) == MXL_RV32;
>       int start = upper_half ? 32 : 0;
>       int length = rv32 ? 32 : 64;
> -    uint64_t ctr_prev, ctr_val;
> +    uint64_t ctr_val;
>   
>       /* Ensure upper_half is only set for XLEN == 32 */
>       g_assert(rv32 || !upper_half);
>   
> -    ctr_prev = extract64(counter->mhpmcounter_prev, start, length);
>       ctr_val  = extract64(counter->mhpmcounter_val, start, length);
>   
>       if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
> @@ -1431,7 +1432,8 @@ RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
>       if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>           riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>           uint64_t cntr = riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx) -
> -                                                             ctr_prev + ctr_val;
> +                        counter->mhpmcounter_prev +
> +                        counter->mhpmcounter_val;
>           *val = extract64(cntr, start, length);
>       } else {
>           *val = ctr_val;
> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
> index d41a228fb3..60b5ce2529 100644
> --- a/tests/tcg/meson.build
> +++ b/tests/tcg/meson.build
> @@ -169,6 +169,7 @@ subdir('mips64el')
>   subdir('or1k')
>   subdir('ppc64')
>   subdir('ppc64le')
> +subdir('riscv32')
>   subdir('riscv64')
>   subdir('s390x')
>   subdir('sh4')
> diff --git a/tests/tcg/riscv32/meson.build b/tests/tcg/riscv32/meson.build
> new file mode 100644
> index 0000000000..c08dfd772d
> --- /dev/null
> +++ b/tests/tcg/riscv32/meson.build
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +cc = 'riscv64-linux-gnu-gcc'
> +cc_dockerfile = 'debian-all-test-cross'
> +cc_docker_host_arch = ['aarch64', 'x86_64']
> +
> +subdir('system')
> diff --git a/tests/tcg/riscv32/semihost.ld b/tests/tcg/riscv32/semihost.ld
> new file mode 100644
> index 0000000000..874838a865
> --- /dev/null
> +++ b/tests/tcg/riscv32/semihost.ld
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +ENTRY(_start)
> +
> +SECTIONS
> +{
> +    /* virt machine, RAM starts at 2gb */
> +    . = 0x80000000;
> +    .text : {
> +        *(.text)
> +    }
> +    .rodata : {
> +        *(.rodata)
> +    }
> +    /* align r/w section to next 2mb */
> +    . = ALIGN(1 << 21);
> +    .data : {
> +        *(.data)
> +    }
> +    .bss : {
> +        *(.bss)
> +    }
> +}
> diff --git a/tests/tcg/riscv32/system/meson.build b/tests/tcg/riscv32/system/meson.build
> new file mode 100644
> index 0000000000..16f9a06c94
> --- /dev/null
> +++ b/tests/tcg/riscv32/system/meson.build
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +tests = []
> +
> +link_script = files('../semihost.ld')[0]
> +cflags = ['-march=rv32im_zicsr',
> +          '-mabi=ilp32',
> +          '-nostdlib',
> +          '-ffreestanding',
> +          '-Wa,--noexecstack',
> +          '-Wl,-T', link_script]
> +qemu_args = ['-M', 'virt',
> +             '-display', 'none',
> +             '-serial', 'stdio',
> +             '-semihosting',
> +             '-bios']
> +
> +tests += {
> +  'test-mcycle.S': {
> +    'cflags': cflags,
> +    'qemu_args': ['-icount', 'shift=1', qemu_args],
> +  },
> +}
> +
> +if 'qemu-system-riscv32' in emulators
> +  tcg_tests += {
> +    'riscv32-softmmu': {
> +      'cc': cc,
> +      'cc_dockerfile': cc_dockerfile,
> +      'cc_docker_host_arch': cc_docker_host_arch,
> +      'folder': 'riscv32',
> +      'gdb_arch': 'riscv32',
> +      'qemu': emulators['qemu-system-riscv32'],
> +      'tests': tests,
> +    }
> +  }
> +endif
> diff --git a/tests/tcg/riscv32/test-mcycle.S b/tests/tcg/riscv32/test-mcycle.S
> new file mode 100644
> index 0000000000..189d1e13a2
> --- /dev/null
> +++ b/tests/tcg/riscv32/test-mcycle.S
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +	.option	norvc
> +
> +	.text
> +	.global	_start
> +_start:
> +	/* Exercise writes while mcycle is running. */
> +	csrw	mcountinhibit, zero
> +	csrw	mcycle, zero
> +
> +	/* A write to the high half must be immediately observable. */
> +	li	s0, 0x1234ffff
> +	csrw	mcycleh, s0
> +	csrr	t0, mcycleh
> +	bne	t0, s0, fail
> +
> +	/* Check carry from the low half into the high half. */
> +	li	s0, 0x12345678
> +	csrw	mcycleh, s0
> +	li	t0, 0xfffffff0
> +	csrw	mcycle, t0
> +	.rept	32
> +	nop
> +	.endr
> +	csrr	t0, mcycleh
> +	addi	s0, s0, 1
> +	bne	t0, s0, fail
> +
> +	/* A low-half write must preserve the carried high half. */
> +	li	t0, 0x22222222
> +	csrw	mcycle, t0
> +	csrr	t0, mcycleh
> +	bne	t0, s0, fail
> +
> +	li	t0, 0x100000
> +	li	t1, 0x5555	/* FINISHER_PASS */
> +	sw	t1, 0(t0)
> +	j	.
> +
> +fail:
> +	li	t0, 0x100000
> +	li	t1, 0x13333	/* status = FINISHER_FAIL, code = 1 */
> +	sw	t1, 0(t0)
> +	j	.


