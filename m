Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B5FC982C9
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 17:02:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x6t1A-0006GI-0n; Wed, 16 Sep 2026 13:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6szU-0005Un-Ky
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 13:00:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6szS-00048L-Do
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 13:00:12 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GGtL2e3402939
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 17:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6Kt1DXg0ZR71yxnt0jF0Xwp/+qXTS4KAw3xZ6JK/VBs=; b=WOxFtBk9uMA0UTNV
 VKoDbD0vI5YfC9DadNfmWpZDiL66ekSkqFqYtgYOlJiIolKajMPSUnOfdWM8W+k+
 Rw6yO1n+G7pFS2gMqvFmUTFzVNyABFuAeLCNc6g2friKybWLsp8Wqgk7Jjmrik9Q
 UPFpfAqQn9dxEJuxT6JUMBmwehmd/JuHE9G/oTgNXUXnle6jd18IPONrn4YhP7Vn
 3JlVMOKBuXWw3YCCZLODPrKza3L6x/D6pXKO3Q66OJJ33K5Br8H9jXYyPXOASRD9
 k9NxZsm8p0G38gDUBfqeK5S7NvOeRo9Q20YROspzsIgnAzL7xBG2aLXt9tgWBGGM
 E5l4dg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d00mr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 17:00:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-39de4a68f7cso6092918a91.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789578008; x=1790182808; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6Kt1DXg0ZR71yxnt0jF0Xwp/+qXTS4KAw3xZ6JK/VBs=;
 b=hjebInrN36vfODZhhqPVYCMCAz+RLTdh10DviBZ8LSiBNxDeyTG99qcNTICZHg35iK
 71V1ShrQEIqm5BF/DeBTymfxv1IyT9U2aTBXcy0Yzo8Csh+N7j1d2FZK8s5aBfJGEXlH
 5IYyewJxxrD7yj4yOdVMHQIfJ/9n6L4N+kdyitumbPI3yI8g8K0PpHDbXdS2xnHloluO
 ty6m9ONAigdC94JvcVUiSJmw6jnv20oEMlC+CBxPBFRk42N20vdNXqRggWcTJMYvBV+S
 a6UKyNv1Tgy7xfk9kLCJ8yaVcgcbOo07VLCM5leBkByarDBNf7b/OwuVnx1g5TJSQnFL
 J6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789578008; x=1790182808;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6Kt1DXg0ZR71yxnt0jF0Xwp/+qXTS4KAw3xZ6JK/VBs=;
 b=TX6++PtRT6gfZnNAR0hpX7kGYadRoHIa9ZhQ4h81Q/eQWFNyYUItrHlrGVIP/bGhOL
 Zp9WN7LJDeWLk+cCERe7Sxrh8xBhBRafO2q/idb6kxhQs3Tl1UgsJXRPx8n4xKaiVu5O
 Vobn9uUer7jv52y8VC7Q3paRVEhq5dKD6PKDsyhhr2PVGwXOlwEmmS7FVHKVsTaF152b
 Fu6qyk+3BZwt60/2RdRdqdv7nVtlhqtPFR8dwlnWmMAckLlY6SxOJc5NX6pjMHgvmux7
 jJzdL4IOY5HU5f1At0vIM6et6Jt4qJbfEqs1clVFV4k4vtSaSV6IO4w1zitn77jPtKy8
 6weA==
X-Gm-Message-State: AFuF++l1j2A6UnCJCI1Dd7QeQwkDFjUro/LE832TK24FzSTxfYdLMCy7
 21NvOmU4urITXBE7vh7n044OooGclP7J9Nbl4bTs/zJ422VPvR5KibapOdRFx6JwhOYaVcofkPw
 kk3zuhBhhdQziC/uJDGq3JemKLevYfqemeT3vnQRtdHN86rBx64VS7m2ll7nSSSYEqA==
X-Gm-Gg: AYBFou2IChkJykMJ7PDF9vS/0klmgSI/nB/jkCKBWNWTy3xIivp+E8/fMYmBqIS+uyA
 UKiSGOFxiPQJPkzZs+TwoDo9YnMg9RRf+whTdonSCfYr14ae1CPy9uStOfiIH1Cs360hwpauKLJ
 /BFk6nfTzlZLTwXAOhD4FN3uJGV+LR0gsRdqmqxZ+DFwplW8VVd25kvOjFRH4DHgZaEf6fxnlII
 OjQZBLX8J1SjAEGz/WraOJL8LJSlslCqLEcBmZbZ/hRxJPUISNIXDIFyPVN0bBTkOTX4ELeJb70
 hgEJypZ06hF5Uji++g5JrNcJ2yAcBv9v5QIEUNhwFHqAnTocGR1tOK4+nTlbtW0nL4QKOwpMPwK
 gJw2xS/O+sg/AFF4fBI5sO7FByhVa62DUKAMB5HqE55vlXdYA8t5yzg8PRXQ/QhJCf+SL
X-Received: by 2002:a17:90a:d2ce:b0:39e:359e:ab44 with SMTP id
 98e67ed59e1d1-39e359eafb3mr1247606a91.22.1789578008005; 
 Wed, 16 Sep 2026 10:00:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:39e:359e:ab44 with SMTP id
 98e67ed59e1d1-39e359eafb3mr1247361a91.22.1789578007363; 
 Wed, 16 Sep 2026 10:00:07 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5a6a1a5sm9658704eec.5.2026.09.16.10.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 10:00:06 -0700 (PDT)
Message-ID: <81558df8-d12b-4cee-97ed-881db86484e3@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:00:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] target/riscv: Stub out kvm functions
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20260916-hw-riscv-cpu-int-v4-0-babc367b60f5@rev.ng>
 <20260916-hw-riscv-cpu-int-v4-5-babc367b60f5@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916-hw-riscv-cpu-int-v4-5-babc367b60f5@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 62nHt7GF8H9og7wOJDCpgi8zD7KwP-fJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfX5y0kkmXZvvqq
 oqrbRbipmRHgUf7OUEHzfBFcrVMAJN6XZcbKagkLJvF/K/TdGIUCwl/l3MjLWRgm7pOHsHK1Jiz
 z0S2W/gVnXLWkYY/a44Ht5jqagnf3FM=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aaacb18 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kpU9yTeD4eOIFxFAU9AA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 62nHt7GF8H9og7wOJDCpgi8zD7KwP-fJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfXzkAkC4zY8oaY
 mpoFXbMCf4sevhWjvVRo8sKG6cIqolCl8v5o/wuSXWzm+Zuwxu3omgMcXK7Q3kDmU9eUignow5s
 sh4sTaLreWrqny+KNztgCziZS1OBZF1wCS5hwGN2DlpcWiYcVV/UcDgXWKTxobSXJzvksKSbbT2
 ML5KK3R5VSefOjW8zx2wql+ize9L+QVBZ0KsqG3HqdYhYEFNuB4phZr4PrrXBVl+pfTQDQLNys7
 lJefC3G60DQvf/Z0ZErpeUxBPAUFxC8emwimd8WVygWYsQEWQ6DgQXUxBwbcQMaBhRqnlnYSo+k
 C//5hftSNXastxKj3StG2IxO9cSVl74FcOy4HMPt1UDNzg9xFmpl0NuDutzxLRRYqW/N0/xLtMt
 UC6dcoonnhQrNzDsc5UD1m4bpFLYppO5vyoiWQQ22Vsuz/3+3x/8t5GcPWwoIp5HVs56nVafsdK
 nPErDDRre7AvoLl228g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160233
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 9/16/2026 2:19 AM, Anton Johansson wrote:
> Functions used externally by hw/riscv are stubbed out for non-kvm
> configurations, allowing a single compilation of hw/riscv.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/kvm/kvm-stub.c  | 23 +++++++++++++++++++++++
>  target/riscv/kvm/meson.build |  1 +
>  target/riscv/meson.build     |  3 +++
>  3 files changed, 27 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

