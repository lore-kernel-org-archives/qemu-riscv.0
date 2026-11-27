Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9DC606A31C
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f7PCJltB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPRaaJRq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWzRd-0003xr-HX; Fri, 27 Nov 2026 12:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xWzRb-0003xb-Av
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2026 12:09:07 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xWzRZ-0006rN-Ok
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2026 12:09:07 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ARFpHQM2032601
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 17:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +H/xfE97NggNycROBp/OvUvGFoRXCJdWUH7h17XEsjM=; b=f7PCJltBfUXVOohn
 xUJ/HmJHdQuGtCPuoOxDcMdDia8aBz2EfyjEybEMtxC0X/XYiT36x0PkhBmb6cJN
 zZ/iifrkxiCa3sTX6PCOkXY2lhf6n2mRYYDS/KzszfQ6GViDiXuA8vCl7VKTAO3O
 uksedunddL+WQqaBvLlN3kVSNnILQMxQYqghGKD3Nd2byxS6ed2rP6gYfBfjCBFy
 pRjy6I8MkdTYPO+nio+CVmRCC/DS0OQ4KTrN6g6TBFdGw9ogTwWIVDIPqIbL5H76
 Bb9fEDU/5rG0h7Vg+vX3gYuYqlphp+0iaa2jJL37IS/dvviHE1n63asIZ8+GsXiW
 ycMHZw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3bgew-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 17:09:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-384c78aa0dbso10312121eec.0
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 09:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795799343; x=1796404143; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+H/xfE97NggNycROBp/OvUvGFoRXCJdWUH7h17XEsjM=;
 b=NPRaaJRqBWyXgs4OboIoaCwpkG3Kz2WUhvZiJFe8N8giHwGeY7v69vdxU82roTsz5q
 VTaFWzZkknNy9+BNw8DNyyDQxgLHO3VUwtjoNourwW0UokBe16xass41w2cQwblQ3WEB
 toPaKApq/SJAq6WQ0/zM48eisHM/u9uoW8D2o8mXb+hknMDBNCBt60Vgfee8nK/YXI7O
 1oD5GorJ3/+ANDpUgLR/Tx2M0Y+n/hXs7RB4HXwxvLCT5sVz+wVtllPAOOTQPTTnjBhk
 OT6p5ZQSVlgRGecHJ371utO2l26hFNYD0tszPFSY44gf5KVXHpYUozj6Xjep2u9zY+bn
 6TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795799343; x=1796404143;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+H/xfE97NggNycROBp/OvUvGFoRXCJdWUH7h17XEsjM=;
 b=XNoHeJzHbqec/MRsZFTSBGXbqUFjufA17/32NPSlxBaDHWNOOHUinDKwjTnRZgLB2K
 OlE5HS5rJd9COkoPtzwltoT39rdXrCuNd6NMgvs5EXhBWSkWWw2SGolCO0HDCRiDypyp
 82u3RvE2VzWEjB3lyLmxxqe05g/AJL5wirhzw5uew8M9OarJlm5ADAksUK70F0s+9VPo
 2Ydq6VForjSQxxUqcLwgGbUjowrdsTf1xXM9no5c9ZrabuSmtvxIaf+r5u7HRWKtRS3R
 5BDXjgIPr8pRXWVPpG8J7DDOJgBUXUjIcIZf/QomVzdOrs+LB8Tl/T/XBAyG8tyJZUSy
 ftww==
X-Forwarded-Encrypted: i=1;
 AL+hErFq+GfEI1XkTv3bmGmTCsUPEh3Cc8LvLtu0cJebi7WnnkxKu+xUQ9G8AvOykRFJr0UlbsOGcEtdWzfL@nongnu.org
X-Gm-Message-State: APuU4Z9kwip/ruY57eM8xcJCyGUzojaXRv+dU15D5lAM7EZjkGlWNdD5
 QSDNqLubTi9kr560WaMQfm4l/MLLJyo0pnl2v3D9xD479kJPGn45h8sy+Ke872itOFPcGEQs5K0
 IXG4rCqAzO1hFc7gZxldnJzNVU0vFYIo22TY4TwqdYpimbDQSrxayhVatWw==
X-Gm-Gg: AZFdTZclKuBSzOs3ETTQ9VwAKkjWpVxFYMIBbMANLBa9JiAmPlS2wKyoU8903cadxVv
 4PjXVFwF/EsUw6UmwF+fwVRecEyXbQDMtAo/PJoO6dLe5Vqvels7oC00O+mEhEM7Tk0BviiuyXi
 yKsrfPUkMv/ex8FOjBx4p7MVIs9YEplYg5AyQdw+8BFcqcZ5L/FgXy+PZ2qzu/t4IHOC2uAnDxX
 Qst6Dw7/Vedk/rbu7+2PFpKge1JemRiF/qefbvwfONqbnw+y2rm81L2hBl9vDRO7uPAb36bPvom
 Vn3NmngaR1i0KPpIqnmCleWjqey7V6LwA6Mve9kuI+hRMZTC9Ur5gm8GsaJWYMi+5ysBpgo4o3J
 DUEasvPwfvXdY5l11fw3XQtTb6sg7q/8UxkYBdDd1nHFyq7pvFWiToyG0qFA8V++QjRP+15+9rl
 7ctBzrAKryyIEbs54dluEc9glNC4nS8alOhKac5DQGXjQ=
X-Received: by 2002:a05:693c:8084:b0:36f:4981:da16 with SMTP id
 5a478bee46e88-3857073f5ebmr23442295eec.25.1795799342823; 
 Fri, 27 Nov 2026 09:09:02 -0800 (PST)
X-Received: by 2002:a05:693c:8084:b0:36f:4981:da16 with SMTP id
 5a478bee46e88-3857073f5ebmr23442276eec.25.1795799342241; 
 Fri, 27 Nov 2026 09:09:02 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385672ce402sm70051550eec.16.2026.11.27.09.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2026 09:09:01 -0800 (PST)
Message-ID: <5cd3e56c-297e-469a-af18-b201bb99d032@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:09:00 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] accel/tcg: Factor icount_running_cpu() out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 TANG Tiancheng <lyndra@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261126222530.62175-1-philmd@oss.qualcomm.com>
 <20261126222530.62175-2-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261126222530.62175-2-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09b92f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NromAgFTz8thGiVjJsYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: niwsj3oXNEyopbU0tyTB_jTDxFVV7kqk
X-Proofpoint-ORIG-GUID: niwsj3oXNEyopbU0tyTB_jTDxFVV7kqk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2OCBTYWx0ZWRfXzVHxCx7+F/Ml
 dBEMxtC1zpA9wUVO6ND2KB6kKUSIcJHR0uNw9Qx6En6/hbcUAcuWzQdnrQMMnPOg5fLkvosxdFi
 JLq+J+MRwOPb8HlTJrvEMJFu0nc7w1yPfN/RL3r8N0Fnxk3zF7xA8MnVzyMnfBQbJFrbO/C4K7G
 g4+vsnX8TEEIP30I+NN5Gijp4XzF6jfu7SWtwBK8mpzbZQtMyGuS6uPY/NwBWlViD2G3fTB9o2e
 /1oSTtmuOnMvAxJSiNupvhS8iR3CVT7n8+k0XkMHn875gXpK4djMsa2+yxUduqDn4JVYrI7drP6
 755sUpAJPCU/o7i0itMO8n2VftLGFh7WN5Rz4LnrdFPdeQXJIBP4Vu6w1nODQt6WSmb0Xk2TSqR
 CyVpzFAKHmA6B+CZsbn+PpuQRn2EhJNcyuq1OHB3hTz2exdKsUZz8IwxIKlYqk6dY7jw3nWrLzR
 U1N567f2qzikrsE/j6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2OCBTYWx0ZWRfX49UYatbASjH9
 VRfBQyswFTSc9WNEfTayd/e6Cs4VvmVBhtmUiupE2VS8scB855g/1szy4QZqn3WXWJwNeXXoKjD
 PlPOGIcj70zENVyT1TVicVn8rS06tk8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270068
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

On 11/26/2026 2:25 PM, Philippe Mathieu-Daudé wrote:
> Extract the running vCPU check from icount_get_raw_locked(),
> to reuse it in a following commit.
> 
> No functional change.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  accel/tcg/icount-common.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

