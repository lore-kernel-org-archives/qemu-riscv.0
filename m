Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40880C61DD3
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 21:03:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1VdP-0005gV-KI; Tue, 01 Sep 2026 17:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1VdO-0005fi-8J
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 17:03:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1VdL-0003Lp-Ew
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 17:03:09 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681KTDdr3663784
 for <qemu-riscv@nongnu.org>; Tue, 1 Sep 2026 21:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b0yItMi8o672xb063eFff9lvWiOqsgC75//Hyp+vIDo=; b=E61LBQ74r7BaKK6q
 zle4yqgAUsJ2UoLftmfErLd/63QOGeW6yR9adXQmaJ6L8+vPsmo8GGaZebtsGf+P
 m1dZva7+Y0hUNG1wqttKgz4CsygrBncU0J/dqzu0n2DqL8uOzptPbv56kJt+GUR7
 TpdRsMsAawJA2KmJ1YYAepwO40fbkAJIQKwINi0DB4ViMn5Zzp2ykkpb9u1CGOZ9
 dJ0Q0nPyz7SdqgCAN3ZXX0zsUasTwJzvniDAd6anxxKZF8GzFkToRmjNgBAPpjte
 tPuSUCUERAjZcBnPMJC1cg5vB4tHMnaigkNH2h/4u+R1Av0HeyoIHMEqZU+8rS1x
 RN8gsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j0uht-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 21:03:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5302b692c8cso5828301cf.2
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788296585; x=1788901385; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b0yItMi8o672xb063eFff9lvWiOqsgC75//Hyp+vIDo=;
 b=ar0QORMRgFm6C2xCcQ1+Gtozb7cDqE2QeApTrDTzIeECL//8tSz98X3tSJ6VYBj0QW
 53w2qhEpOFpOMsSAIc19ua4CjEUf+7zDuyNjgAB4hTZ9xuw6AqttoowYoCMKg/XjMn+r
 Ff+ewo6H8gp6tl+4yaOI48lBa54ei5E9CSZvtNMnxr+nLe/rRqQcpRHwmIJ+kK3/zpDV
 jo3jcx3hb5jIfr3XBQbdZOyWS8ZQaV3mETOD8WlH1CDAaBx448yGee85YUHWRVbxzKTq
 KveUgMkStwDJ5sPHaQFc+sYkR7WQNUnPN9IdJyEBhp8uaHUc5QSZaAokdbS/TlEhpcj3
 GTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788296585; x=1788901385;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b0yItMi8o672xb063eFff9lvWiOqsgC75//Hyp+vIDo=;
 b=ihXYmNmF/hAcJXDg3t63nPAaBFd/Jqr35DaeZhBq9glDv3KOBUEnttD6E8beXGJyOx
 X70jKPi3Qhl9+I770pVrvK5aYAHQNtYBc+YGJqXwjGL/uGLn6JJepaU0pHyFw3m+pfgB
 APdsgzhjkQQkWVc99Qt2sxGZ2r/IO5jTmJCmH6IaboOYCuDk3fn7/q81rnMPwteHkxSf
 9xbZzdBeBcaknjwv0+iN+pK6nDfFKamz03GYuhd/18XALgB6vn2i2SFz6FKEKxTGY5aI
 8blKB3rQCxJtCNxSNGEC03cnuarjVc3k7XnVuiaVfJYphEIRfrnA3hcaI3cuir8gMK2C
 6GmQ==
X-Gm-Message-State: AFuF++m+yKunCcaSUicvx+SYcOIj8ux32a51I4JKIzZXGKE0S9AsP8fu
 mQteFdVipPLPGn8w0Tbs7LwcwDGnXPB+7/QIQJNQcYaH8Cj1VEdCNjCaDW6t8e3BCfLpjecqdMU
 nJnuQQJ90wIp7xOQlFWb9Uq2lOz9sCKQWFjW5ibun7JJ5VHd+2+dpTLDgbA==
X-Gm-Gg: AR+sD11+7S03tG8qBXyIaUKcibASo53zN2ZoC2h2OcoyvIwDG79GK9WzDb1T/92KEXi
 wqY4LDfA61h16TC2CiJDHKpRG9W9bL0MjVGZk7JCGeZncLiZY/BlKtOo3vytItWpTATrD/1bqp7
 yZ4W81XPgUJH3nPnoXDVZ/29yXLt8SHBLhRVf9/QsL8AesdDn52UtAUo8IBWVPdIZlvwTaUe99i
 Bu45RvruOfwSgVFQfj/KDaxMdEM7doRKJGyyeWA48Tz5oWqT5vfB80XyDMTiwXjn51OPy2YRFOz
 rDHMucSHp3wrk0ulQqCCOQIx2wXrJ9KLCJkleMemq+NvYfo+IpxggKpk3lhlaO9hgjH02RbmPy9
 d3yA4tSaBdCv7jXPWhAdde2xsl9EyhUZhNbZ6
X-Received: by 2002:a05:622a:5913:b0:52f:f472:bad1 with SMTP id
 d75a77b69052e-52ff472c08bmr422198781cf.33.1788296584263; 
 Tue, 01 Sep 2026 14:03:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5913:b0:52f:f472:bad1 with SMTP id
 d75a77b69052e-52ff472c08bmr422196761cf.33.1788296583290; 
 Tue, 01 Sep 2026 14:03:03 -0700 (PDT)
Received: from [192.168.68.101] ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530331d9d83sm4984841cf.14.2026.09.01.14.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 14:03:02 -0700 (PDT)
Message-ID: <6cf265f7-da12-47b5-b769-2dcab261ae92@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:02:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/tcg/riscv64: Add tests for Zvabd extension
To: Mingliang Liu <liumingliang.dev@bytedance.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com,
 chao.liu@processmission.com
References: <20260831133000.982059-1-liumingliang.dev@bytedance.com>
 <20260831133000.982059-4-liumingliang.dev@bytedance.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260831133000.982059-4-liumingliang.dev@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gRMpugd-7hq3_beltqT1sV-WcSs9ADmB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE4NCBTYWx0ZWRfXwWFjMIX0RtbE
 A9vrHCBh07528Rp2sROfwyB0hUmuFhSB+MI5SoZeAeMccJ/xeKV2NOScJXCWu61Yx+BSZADtSN4
 USi1xrpcU7iwbC72tolKz7Mx9VZ0wY8=
X-Proofpoint-ORIG-GUID: gRMpugd-7hq3_beltqT1sV-WcSs9ADmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE4NCBTYWx0ZWRfX6/IQVH1iaYjd
 E3XfZzm5N9Zdav/nuu4MMTc6tpBEQtdh62hjJqX0lOhmQ/aRYuXVYPlvl4kgnSCCL058dNQi7xv
 w7Zusgopt8fsym/85pBaLsg6u0L5vtKvkrRXvULpFWTKPW3Tf1hHDhCm7KtVgEqY34agsPIeBWQ
 IOpQmeoXQmxETorA2/fEQkiVEray6+JFgEIvI/L4O55befh/jJ+g+Q7uts8U7v3T8NGmoyffh8r
 528fp6SEtM4XRv7/SJK0D9G2lA9YMCx+0iNinULkHTM+3KCMTkqa0KrZQ6U1vgY3Mpq1w4tXHcu
 4QdH8zOhYvnX7GdI1RuuNTEOX+WkispL5Y0agtSMcaaGqqRRanXDhah746MPoW4HJiiE9bKIIzL
 ypYS0K+sHmpXZdQh9ewjQwTFufZeKnTqAwOfGsukd/0bGzmV+HRRyIZkebZs/lioL306C34TOHa
 YbE8QJ8oHajl8TMCg+w==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a973d89 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=mG-cHNy2rWmjIYH_kXoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010184
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/31/2026 10:30 AM, Mingliang Liu wrote:
> Co-Auther: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Signed-off-by: Mingliang Liu <liumingliang.dev@bytedance.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   tests/tcg/riscv64/Makefile.softmmu-target |   8 +
>   tests/tcg/riscv64/test-zvabd.S            | 659 ++++++++++++++++++++++
>   2 files changed, 667 insertions(+)
>   create mode 100644 tests/tcg/riscv64/test-zvabd.S
> 
> diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
> index 6a219c306c..787fdaab40 100644
> --- a/tests/tcg/riscv64/Makefile.softmmu-target
> +++ b/tests/tcg/riscv64/Makefile.softmmu-target
> @@ -71,5 +71,13 @@ EXTRA_RUNS += run-test-misa-w
>   run-test-misa-w: test-misa-w
>   	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)x-misa-w=true$(comma)c=true$(comma)v=true $(QEMU_OPTS)$<)
>   
> +EXTRA_RUNS += run-test-zvabd
> +ZVABD_CPU = rv64$(comma)v=true$(comma)vlen=256$(comma)x-zvabd=true
> +CLEANFILES += test-zvabd
> +test-zvabd: test-zvabd.o $(LINK_SCRIPT)
> +	$(LD) $(LDFLAGS) $< -o $@
> +run-test-zvabd: test-zvabd
> +	$(call run-test, $<, $(QEMU) -cpu $(ZVABD_CPU) $(QEMU_OPTS)$<)
> +
>   # We don't currently support the multiarch system tests
>   undefine MULTIARCH_TESTS
> diff --git a/tests/tcg/riscv64/test-zvabd.S b/tests/tcg/riscv64/test-zvabd.S
> new file mode 100644
> index 0000000000..01db2fd7dc
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-zvabd.S
> @@ -0,0 +1,659 @@
> +/*
> + * Test the Zvabd vector absolute-difference instructions and the vabs.v
> + * pseudoinstruction.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +	.option arch, +v
> +	.option norvc
> +
> +	.text
> +
> +	.global _start
> +_start:
> +	/* Enable the vector unit (mstatus.VS = Initial). */
> +	li	t0, 1 << 9
> +	csrs	mstatus, t0
> +
> +	/* Route synchronous traps to trap_handler (mtvec direct mode). */
> +	la	t0, trap_handler
> +	csrw	mtvec, t0
> +
> +	/* Run each test function. */
> +	call	test_vabs_v
> +	bnez	a0, _exit
> +	call	test_vabs_v_mask
> +	bnez	a0, _exit
> +
> +	call	test_vabd_vv
> +	bnez	a0, _exit
> +	call	test_vabd_vv_mask
> +	bnez	a0, _exit
> +
> +	call	test_vabd_vx
> +	bnez	a0, _exit
> +	call	test_vabd_vx_mask
> +	bnez	a0, _exit
> +
> +	call	test_vabdu_vv
> +	bnez	a0, _exit
> +	call	test_vabdu_vv_mask
> +	bnez	a0, _exit
> +
> +	call	test_vabdu_vx
> +	bnez	a0, _exit
> +	call	test_vabdu_vx_mask
> +	bnez	a0, _exit
> +
> +	call	test_vwabda_vv
> +	bnez	a0, _exit
> +	call	test_vwabda_vv_mask
> +	bnez	a0, _exit
> +
> +	call	test_vwabda_vx
> +	bnez	a0, _exit
> +	call	test_vwabda_vx_mask
> +	bnez	a0, _exit
> +
> +	call	test_vwabdau_vv
> +	bnez	a0, _exit
> +	call	test_vwabdau_vv_mask
> +	bnez	a0, _exit
> +
> +	call	test_vwabdau_vx
> +	bnez	a0, _exit
> +	call	test_vwabdau_vx_mask
> +	bnez	a0, _exit
> +
> +	j	_exit
> +
> +test_vabs_v:
> +	vsetivli zero, 2, e8, m1, ta, ma
> +
> +	/* Load .arr_neg array in v1 */
> +	la     t0,.arr_neg
> +	vle8.v v1,0(t0)
> +
> +	/* vabs.v v2, v1 (vabd.vx v2, v1, x0) raw opcode */
> +	.word   0x56106157
> +
> +	/* Load .arr_pos in v3 */
> +	la      t1,.arr_pos
> +	vle8.v  v3,0(t1)
> +
> +	/* Compare v2 and v3 into v0 */
> +	vmsne.vv  v0,v2,v3
> +	vcpop.m a0,v0
> +	snez    a0,a0
> +
> +	ret
> +
> +test_vabs_v_mask:
> +	vsetivli zero, 2, e8, m1, ta, mu
> +
> +	/* Load .arr_neg array in v1 */
> +	la      t0, .arr_neg
> +	vle8.v  v1, 0(t0)
> +
> +	/* Zero v2 using .arr_zero */
> +	la     t0,.arr_zero
> +	vle8.v v2,0(t0)
> +
> +	/* Load .v0_mask array in v0 */
> +	la     t1,.v0_mask
> +	vle8.v v0,0(t1)
> +
> +	/* vabs.v v2, v1, v0.t raw opcode */
> +	.word   0x54106157
> +
> +	/* Load .arr_masked in v3 */
> +	la      t0,.arr_masked
> +	vle8.v  v3,0(t0)
> +
> +	/* Compare v2 and v3 into v0 */
> +	vmsne.vv  v0,v2,v3
> +	vcpop.m a0,v0
> +	snez    a0,a0
> +
> +	ret
> +
> +test_vabd_vv:
> +	/*
> +	 * Test signed vector-vector absolute difference:
> +	 * abs({-5, -7} - {5, 7}) = {10, 14}.
> +	 */
> +	vsetivli zero, 2, e8, m1, ta, mu
> +
> +	/* Load the two signed source vectors into v1 and v3. */
> +	la      t0, .arr_neg
> +	vle8.v  v1, 0(t0)
> +	la      t0, .arr_pos
> +	vle8.v  v3, 0(t0)
> +
> +	/* Execute vabd.vv v2, v1, v3. */
> +	.word   0x5611a157
> +
> +	/* Load the expected result into v3. */
> +	la      t0, .expect_vabd_vv
> +	vle8.v  v3, 0(t0)
> +
> +	/* Compare v2 and v3 into v0 */
> +	vmsne.vv  v0, v2, v3
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +
> +	ret
> +
> +test_vabd_vv_mask:
> +	/*
> +	 * Test masked vabd.vv.  Element 0 remains 9 and element 1 becomes
> +	 * abs(-7 - 7) = 14.
> +	 */
> +	vsetivli zero, 2, e8, m1, ta, mu
> +
> +	/* Load the two signed source vectors into v1 and v3. */
> +	la      t0, .arr_neg
> +	vle8.v  v1, 0(t0)
> +	la      t0, .arr_pos
> +	vle8.v  v3, 0(t0)
> +
> +	/* Load original value into v2 */
> +	la      t0, .arr_init
> +	vle8.v  v2, 0(t0)
> +
> +	/* Load mask value into v0 */
> +	la      t0, .v0_mask
> +	vle8.v  v0, 0(t0)
> +
> +	.word   0x5411a157
> +
> +	/* Load the expected result into v3. */
> +	la      t0, .expect_vabd_vv_masked
> +	vle8.v  v3, 0(t0)
> +
> +	vmsne.vv  v0, v2, v3
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vabd_vx:
> +	/*
> +	 * Test signed vector-scalar absolute difference:
> +	 * abs({-5, -7} - 3) = {8, 10}.
> +	 */
> +	vsetivli zero, 2, e8, m1, ta, mu
> +	la      t0, .arr_neg
> +	vle8.v  v1, 0(t0)
> +	li      a2, 3
> +
> +	/* Execute vabd.vx v2, v1, a2. */
> +	.word   0x56166157
> +
> +	/* Load the expected result into v3. */
> +	la      t0, .expect_vabd_vx
> +	vle8.v  v3, 0(t0)
> +
> +	vmsne.vv  v0, v2, v3
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vabd_vx_mask:
> +	/*
> +	 * Test masked vabd.vx.  Element 0 remains 9 and element 1 becomes
> +	 * abs(-7 - 3) = 10.
> +	 */
> +	vsetivli zero, 2, e8, m1, ta, mu
> +
> +	la      t0, .arr_neg
> +	vle8.v  v1, 0(t0)
> +	li      a2, 3
> +
> +	la      t0, .arr_init
> +	vle8.v  v2, 0(t0)
> +
> +	la      t0, .v0_mask
> +	vle8.v  v0, 0(t0)
> +
> +	.word   0x54166157
> +
> +	la      t0, .expect_vabd_vx_masked
> +	vle8.v  v3, 0(t0)
> +
> +	vmsne.vv  v0, v2, v3
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vabdu_vv:
> +	/*
> +	 * Test unsigned vector-vector absolute difference:
> +	 * abs({0, 255} - {255, 0}) = {255, 255}.
> +	 */
> +	vsetivli zero, 2, e8, m1, ta, mu
> +
> +	/* Load the two unsigned source vectors into v1 and v3. */
> +	la      t0, .arr_unsigned_lhs
> +	vle8.v  v1, 0(t0)
> +	la      t0, .arr_unsigned_rhs
> +	vle8.v  v3, 0(t0)
> +
> +	/* Execute vabdu.vv v2, v1, v3. */
> +	.word   0x5a11a157
> +
> +	/* Load the expected result into v3. */
> +	la      t0, .expect_vabdu_vv
> +	vle8.v  v3, 0(t0)
> +
> +	vmsne.vv  v0, v2, v3
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vabdu_vv_mask:
> +	/*
> +	 * Test masked vabdu.vv.  Element 0 remains 9 and element 1 becomes
> +	 * abs(255 - 0) = 255.
> +	 */
> +	vsetivli zero, 2, e8, m1, ta, mu
> +
> +	la      t0, .arr_unsigned_lhs
> +	vle8.v  v1, 0(t0)
> +	la      t0, .arr_unsigned_rhs
> +	vle8.v  v3, 0(t0)
> +
> +	la      t0, .arr_init
> +	vle8.v  v2, 0(t0)
> +
> +	la      t0, .v0_mask
> +	vle8.v  v0, 0(t0)
> +
> +	.word   0x5811a157
> +
> +	la      t0, .expect_vabdu_vv_masked
> +	vle8.v  v3, 0(t0)
> +
> +	vmsne.vv  v0, v2, v3
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vabdu_vx:
> +	/*
> +	 * Test unsigned vector-scalar absolute difference:
> +	 * abs({0, 255} - 128) = {128, 127}.
> +	 */
> +	vsetivli zero, 2, e8, m1, ta, mu
> +
> +	la      t0, .arr_unsigned_lhs
> +	vle8.v  v1, 0(t0)
> +	li      a2, 128
> +
> +	/* Execute vabdu.vx v2, v1, a2. */
> +	.word   0x5a166157
> +
> +	la      t0, .expect_vabdu_vx
> +	vle8.v  v3, 0(t0)
> +
> +	vmsne.vv  v0, v2, v3
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vabdu_vx_mask:
> +	/*
> +	 * Test masked vabdu.vx.  Element 0 remains 9 and element 1 becomes
> +	 * abs(255 - 128) = 127.
> +	 */
> +	vsetivli zero, 2, e8, m1, ta, mu
> +
> +	la      t0, .arr_unsigned_lhs
> +	vle8.v  v1, 0(t0)
> +	li      a2, 128
> +
> +	la      t0, .arr_init
> +	vle8.v  v2, 0(t0)
> +
> +	la      t0, .v0_mask
> +	vle8.v  v0, 0(t0)
> +
> +	.word   0x58166157
> +
> +	la      t0, .expect_vabdu_vx_masked
> +	vle8.v  v3, 0(t0)
> +
> +	vmsne.vv  v0, v2, v3
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vwabda_vv:
> +	/*
> +	 * Test signed widening vector-vector absolute difference and
> +	 * accumulation. Start with v4 = {1000, -1000}, and the expected
> +	 * widened result is {1000, -1000} + abs({-5, -7} - {5, 7}) =
> +	 * {1010, -986}.
> +	 */
> +	/* Load the 16-bit accumulator before selecting 8-bit operands. */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .arr_signed_acc
> +	vle16.v v4, 0(t0)
> +
> +	vsetivli zero, 2, e8, m1, ta, mu
> +	la      t0, .arr_neg
> +	vle8.v  v1, 0(t0)
> +	la      t0, .arr_pos
> +	vle8.v  v2, 0(t0)
> +
> +	/* Execute vwabda.vv v4, v1, v2. */
> +	.word   0xf6110257
> +
> +	/* Select the widened EEW and compare v4 with the expected result. */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .expect_vwabda_vv
> +	vle16.v v6, 0(t0)
> +
> +	vmsne.vv  v0, v4, v6
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vwabda_vv_mask:
> +	/*
> +	 * Test masked vwabda.vv.
> +	 * Start with v4 = {1000, -1000}, v0 = {0, 1}, and the expected widened
> +	 * result is {1000, -1000} + abs({-5, -7} - {5, 7}) = {1000, -986}.
> +	 */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .arr_signed_acc
> +	vle16.v v4, 0(t0)
> +
> +	vsetivli zero, 2, e8, m1, ta, mu
> +	la      t0, .arr_neg
> +	vle8.v  v1, 0(t0)
> +	la      t0, .arr_pos
> +	vle8.v  v2, 0(t0)
> +
> +	la      t0, .v0_mask
> +	vle8.v  v0, 0(t0)
> +
> +	.word   0xf4110257
> +
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .expect_vwabda_vv_masked
> +
> +	vle16.v v6, 0(t0)
> +	vmsne.vv  v0, v4, v6
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vwabda_vx:
> +	/*
> +	 * Test signed widening vector-scalar absolute difference and
> +	 * accumulation. With scalar 3, v4 becomes {1000 + 8, -1000 + 10}.
> +	 */
> +	/* Load the 16-bit accumulator before selecting 8-bit operands. */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .arr_signed_acc
> +	vle16.v v4, 0(t0)
> +
> +	vsetivli zero, 2, e8, m1, ta, mu
> +	la      t0, .arr_neg
> +	vle8.v  v1, 0(t0)
> +	li      a2, 3
> +
> +	/* Execute vwabda.vx v4, v1, a2. */
> +	.word   0xf6164257
> +
> +	/* Select the widened EEW and compare v4 with the expected result. */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .expect_vwabda_vx
> +	vle16.v v6, 0(t0)
> +
> +	vmsne.vv  v0, v4, v6
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vwabda_vx_mask:
> +	/*
> +	 * Test masked vwabda.vx.  Element 0 remains 1000 while element 1
> +	 * accumulates 10 and becomes -990.
> +	 */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +
> +	la      t0, .arr_signed_acc
> +	vle16.v v4, 0(t0)
> +
> +	vsetivli zero, 2, e8, m1, ta, mu
> +	la      t0, .arr_neg
> +	vle8.v  v1, 0(t0)
> +	li      a2, 3
> +
> +	la      t0, .v0_mask
> +	vle8.v  v0, 0(t0)
> +
> +	.word   0xf4164257
> +
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .expect_vwabda_vx_masked
> +	vle16.v v6, 0(t0)
> +
> +	vmsne.vv  v0, v4, v6
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vwabdau_vv:
> +	/*
> +	 * Test unsigned widening vector-vector absolute difference and
> +	 * accumulation. Start with v4 = {1000, 2000}, adding {255, 255}
> +	 * produces {1255, 2255}.
> +	 */
> +	/* Load the unsigned 16-bit accumulator and 8-bit source vectors. */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +
> +	la      t0, .arr_unsigned_acc
> +	vle16.v v4, 0(t0)
> +	vsetivli zero, 2, e8, m1, ta, mu
> +
> +	la      t0, .arr_unsigned_lhs
> +	vle8.v  v1, 0(t0)
> +	la      t0, .arr_unsigned_rhs
> +	vle8.v  v2, 0(t0)
> +
> +	/* Execute vwabdau.vv v4, v1, v2. */
> +	.word   0xfa110257
> +
> +	/* Select the widened EEW and compare v4 with the expected result. */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .expect_vwabdau_vv
> +	vle16.v v6, 0(t0)
> +
> +	vmsne.vv  v0, v4, v6
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vwabdau_vv_mask:
> +	/*
> +	 * Test masked vwabdau.vv.  Element 0 remains 1000 while element 1
> +	 * accumulates 255 and becomes 2255.
> +	 */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +
> +	la      t0, .arr_unsigned_acc
> +	vle16.v v4, 0(t0)
> +
> +	vsetivli zero, 2, e8, m1, ta, mu
> +	la      t0, .arr_unsigned_lhs
> +	vle8.v  v1, 0(t0)
> +	la      t0, .arr_unsigned_rhs
> +	vle8.v  v2, 0(t0)
> +
> +	la      t0, .v0_mask
> +	vle8.v  v0, 0(t0)
> +
> +	.word   0xf8110257
> +
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .expect_vwabdau_vv_masked
> +	vle16.v v6, 0(t0)
> +
> +	vmsne.vv  v0, v4, v6
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vwabdau_vx:
> +	/*
> +	 * Test unsigned widening vector-scalar absolute difference and
> +	 * accumulation. With scalar 128, v4 becomes {1000 + 128, 2000 + 127}.
> +	 */
> +	/* Load the unsigned 16-bit accumulator and 8-bit source vector. */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +
> +	la      t0, .arr_unsigned_acc
> +	vle16.v v4, 0(t0)
> +
> +	vsetivli zero, 2, e8, m1, ta, mu
> +	la      t0, .arr_unsigned_lhs
> +	vle8.v  v1, 0(t0)
> +	li      a2, 128
> +
> +	/* Execute vwabdau.vx v4, v1, a2. */
> +	.word   0xfa164257
> +
> +	/* Select the widened EEW and compare v4 with the expected result. */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .expect_vwabdau_vx
> +	vle16.v v6, 0(t0)
> +
> +	vmsne.vv  v0, v4, v6
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +test_vwabdau_vx_mask:
> +	/*
> +	 * Test masked vwabdau.vx.  Element 0 remains 1000 while element 1
> +	 * accumulates 127 and becomes 2127.
> +	 */
> +	vsetivli zero, 2, e16, m2, ta, mu
> +
> +	la      t0, .arr_unsigned_acc
> +	vle16.v v4, 0(t0)
> +
> +	vsetivli zero, 2, e8, m1, ta, mu
> +	la      t0, .arr_unsigned_lhs
> +	vle8.v  v1, 0(t0)
> +	li      a2, 128
> +
> +	la      t0, .v0_mask
> +	vle8.v  v0, 0(t0)
> +
> +	.word   0xf8164257
> +
> +	vsetivli zero, 2, e16, m2, ta, mu
> +	la      t0, .expect_vwabdau_vx_masked
> +	vle16.v v6, 0(t0)
> +
> +	vmsne.vv  v0, v4, v6
> +	vcpop.m a0, v0
> +	snez    a0, a0
> +	ret
> +
> +
> +/* Exit through the semihosting SYS_EXIT_EXTENDED call with a0 as the code. */
> +_exit:
> +	la	a1, semiargs
> +	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
> +	sd	t0, 0(a1)
> +	sd	a0, 8(a1)
> +	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
> +	.balign	16
> +	slli	zero, zero, 0x1f
> +	ebreak
> +	srai	zero, zero, 0x7
> +	j	.
> +
> +	.balign	4
> +trap_handler:
> +	csrr	t4, mcause
> +	la	t5, trap_mcause
> +	sd	t4, 0(t5)
> +	csrr	t4, mtval
> +	la	t5, trap_mtval
> +	sd	t4, 0(t5)
> +	li	a0, 1
> +	j	_exit
> +
> +	.data
> +	.balign	8
> +semiargs:
> +	.space	16
> +trap_mcause:
> +	.space	8
> +trap_mtval:
> +	.space	8
> +.arr_neg:
> +	.byte -5, -7
> +.arr_pos:
> +	.byte 5, 7
> +.arr_zero:
> +	.byte 0, 0
> +.arr_init:
> +	.byte 9, 9
> +.v0_mask:
> +	.byte 0b10
> +.arr_masked:
> +	.byte 0, 7
> +
> +/* Unsigned input vectors used by vabdu and vwabdau. */
> +.arr_unsigned_lhs:
> +	.byte 0, 255
> +.arr_unsigned_rhs:
> +	.byte 255, 0
> +	.balign 2
> +
> +/* Nonzero accumulators verify the add part of widening operations. */
> +.arr_signed_acc:
> +	.half 1000, -1000
> +.arr_unsigned_acc:
> +	.half 1000, 2000
> +
> +/* Expected results for the unmasked and masked forms. */
> +.expect_vabd_vv:
> +	.byte 10, 14
> +.expect_vabd_vv_masked:
> +	.byte 9, 14
> +.expect_vabd_vx:
> +	.byte 8, 10
> +.expect_vabd_vx_masked:
> +	.byte 9, 10
> +.expect_vabdu_vv:
> +	.byte 255, 255
> +.expect_vabdu_vv_masked:
> +	.byte 9, 255
> +.expect_vabdu_vx:
> +	.byte 128, 127
> +.expect_vabdu_vx_masked:
> +	.byte 9, 127
> +.expect_vwabda_vv:
> +	.half 1010, -986
> +.expect_vwabda_vv_masked:
> +	.half 1000, -986
> +.expect_vwabda_vx:
> +	.half 1008, -990
> +.expect_vwabda_vx_masked:
> +	.half 1000, -990
> +.expect_vwabdau_vv:
> +	.half 1255, 2255
> +.expect_vwabdau_vv_masked:
> +	.half 1000, 2255
> +.expect_vwabdau_vx:
> +	.half 1128, 2127
> +.expect_vwabdau_vx_masked:
> +	.half 1000, 2127


