Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524AACA5FCE
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:05:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCOtO-0000Pg-J4; Thu, 01 Oct 2026 18:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOtH-0000Mg-6U
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:04:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOtF-00026J-G0
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:04:34 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691Fsot83512604
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9VDv496lnuGB35Es+Ee+OP4oh+1bsftr5grRpHrT4v4=; b=b5QtKzzEsiU8cEMs
 rGwY0ZCaMv4fWnBwUPc+YRXVLPrI36YfnabKnwsdfdVAMQ6KIntHi4krTr0aIPep
 2CwrKlt9/1R5n2xuXDUmMWch7RcRg4yvRZVC3qT9jVLbzN07PMA3btej3eIGfB3n
 hLVio5gLPKMHzyteGxntts8k3qzg08qdGXWhvROwQTYpCrVhEOSB0AvO2AKpVfwu
 /rYc9CP9VFHZdAKiTpbuYIUa7s6Yn5/jossFQtMYooM2oJ/qi8hGd4oXlWEvkOF7
 HhFSaJV8lDaTBTnLnd9g4KBSsba8wvH1iZPTKUrxZz8jDVnjmkIE9NBP53BmVJO+
 +YRteQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1qukabfu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:04:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1438492fb40so4951346c88.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892271; x=1791497071; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9VDv496lnuGB35Es+Ee+OP4oh+1bsftr5grRpHrT4v4=;
 b=PSm9xQNm+g0EldbdT0M9b39gy8QnH0lqtXGXKSlYzAxC9YW5RDkYsrrHyh9CgSZuEj
 GCesQcCnxNMYBJP5/TRUIAyaUEG89MOP+0fpvkKoAG3zfCDQzUVY1sMl1rQ1Ips+Db6A
 dafS6cdWQtbB+J5KUh9ftOpaXM+L9QbsM0kNk0ZHC3K8mkZffZ4eUvJaR3q/yDmnzNcI
 tYLnDYukuXweA/hqXC77nEvVVfj17EUsMWewKwfNGCPldmy+pWXIDnGBP9EESV+aCqIy
 M+K7K3ugPekAEQ++L2Y9TWTwk2YyhE/af3KTHv3/frsiGy0SGvcEu3ViPbMtdtRkPKP4
 oJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892271; x=1791497071;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9VDv496lnuGB35Es+Ee+OP4oh+1bsftr5grRpHrT4v4=;
 b=tPFFSPryoeVWdJ8K4M4KC3g3DiTOw4ddEXEJoPvOTJyUoIXpGgHslogEUhgtH4HXyx
 pF6iqU7mxVdg7sHXMc5SnUqGoeM2v9y6oq9Ga34yUlxvWAI6tVR78E7JGLIUUFIQ/gr7
 5sMdsfcAi3o87gbeuRnV7e6GCNSYKkSHrUNOMdQG7AYsIhdx85xkYy+SPTW+mvQu6qvJ
 BU7dRrLoDUMYCYha2LSmqk4EP6Yf1jU+0YI8VvElrfSVLilhJ4v9tTGUFKBodalb6T7q
 m9vI/pP0L2ZAZCxVtvgCnToor/5yZlyn/PCD33CFn2pnwAXx0eJMNmOEAoJ2v4dkDu9m
 eN2A==
X-Gm-Message-State: AFuF++k8nPU64AIWnON46a7V85C/eOzcfMGz+GGXVhY41r7JDiz1YLQp
 GKVolHVC/Tj2IuzWFabK12BhUnI3hdl0PVPIeq7KafhXv+4F/tpA2x2G6RJkOHnpnKqbc1eM2F3
 nc6bBtaGBKZYX9IWtGCczu25ZAU/uMSOcwVTrtrgd5P2qfahovLEV3qkP6A==
X-Gm-Gg: AYBFou2bil6HEKTOVD65s5zNJE0g6JwB6dkBQdYVn7584H4T4O3zDnOdi3qg0uyAjX4
 ZnxDarj20pBlOKykvvqhuGbQTBB9ocjXFtCqzt8i33xsr8si61pvYBiEil/eopWdPY/4va8ev4T
 S+fTKbijKHA3HMQ8i3iS+NGKpp5rX92iW6tXgfbI0/dX4ES15tY5Mh1xuLxbZnD+vQ7T2vxZG/n
 toqmHXr5Ia5mvW4geth44dkht9VsttbKw9e6gYW5eYLJsF8YR/OQOJ20tApvDbvXlUI0BwTzZBp
 FE/3lZiZHBhhFj8NUp942MUCUExNA45gE+Qkrqf6QRFCnXVlw7P+cG9AK/fKasER9fvtLkYiTdS
 BxVwXF7P/pg70NXhgBR5w/SB3cA89pEohF8e2KxNWPBuVXsY29lFyk26dSP9es6jWN0JTLw==
X-Received: by 2002:a05:701b:4209:10b0:143:3617:c595 with SMTP id
 a92af1059eb24-14f590c9c32mr615750c88.1.1790892270663; 
 Thu, 01 Oct 2026 15:04:30 -0700 (PDT)
X-Received: by 2002:a05:701b:4209:10b0:143:3617:c595 with SMTP id
 a92af1059eb24-14f590c9c32mr615721c88.1.1790892270038; 
 Thu, 01 Oct 2026 15:04:30 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f46ab87bcsm1191980c88.9.2026.10.01.15.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:04:29 -0700 (PDT)
Message-ID: <60d3bf47-404b-4733-935c-9cee2830bdba@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:04:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/18] target/riscv: Widen CSR ops to 64-bit and compile
 once for system-mode
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-5-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-5-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX/aw95AKF2sc4
 Qv4V6eD+lwCxe3ckFK7y7DszLANQMDoebLZ6zV+YNBqGMMQpz2xTK2G0J6w2XK7htqokpT5jdk5
 /hDLs/tcdRtT26zabI3TdVi4dV+bXz4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX04GyOVSGTgwq
 CyIqCL9ph3wYN8w7uVCmAzS8+qaafzb77b3mK1ewbvaFkPQju7MuZuu2HgJspg9NDzl0rsrz2OU
 u/V9A9Tn9uAlcXgb+DmXJYGiptgOdaBn6A44mLRtGzUj7TRrYbI63RxyLKYEVUt+pWTLk/diCjx
 uwKb54qDx1h+YN6eWZ2/cjEavEWRc++Hq4/R4Nmx6wP2UGqd0o3n8fBz8KD4P5XheSK/EQg+uDR
 DnuJiLUrqaOv4UfNRhWwCYzK3qY4yuRkkTiJZAB+YET/ABOKj4X2cqHfIQiKS8jP3bgDqkXU0WC
 66zZA1HSVREaoSK3T2eqS6CVoysXyhRSBJ8YnlQVB3JRvFOhfH+djaRfFia+UN6wIK80POr6+HI
 qttKtgz2gWhOKwlC+9spDy9s8L2K/eqIMj452m6HumErnJzphzhp33BfRHnZawejoO5O3SPbGQJ
 8982x8Z1sRf07HlTKsA==
X-Proofpoint-GUID: PnnjVB1o7e9q-pNxeVRyq_K1aHupJF7C
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abed8ef cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=o3JLzeGjXNQsDHrD6qoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: PnnjVB1o7e9q-pNxeVRyq_K1aHupJF7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010088
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/1/2026 8:59 AM, Anton Johansson via qemu development wrote:
> Mostly mechanical change of target_ulong to uint64_t, motivated by the
> fact that csr.c compiled with a 64-bit target_ulong already can handle
> rv32 CPUs just fine.  If there's any discrepancy between rv32 on
> qemu-riscv32 and rv32 on qemu-riscv64 I've failed to take into account
> please do let me know.
> 
> Aside from minor formatting fixes, masks are sometimes replaced with
> ~0ULL, such as for write_vsstatus()
> 
> -    uint64_t mask = (target_ulong)-1;
> +    uint64_t mask = ~0ULL;
> 
> this assumes that the behaviour for rv32 on qemu-riscv64 is correct.
> 
> Functions in other files containing CSR relevant behaviour are
> also updated.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/tcg/csr.h       |  35 +-
>  target/riscv/tcg/debug.h     |  11 +-
>  target/riscv/cpu.c           |  11 +-
>  target/riscv/gdbstub.c       |   2 +-
>  target/riscv/monitor.c       |   5 +-
>  target/riscv/tcg/csr.c       | 736 +++++++++++++++++++++----------------------
>  target/riscv/tcg/debug.c     |  10 +-
>  target/riscv/tcg/mips_csr.c  |  12 +-
>  target/riscv/tcg/op_helper.c |   6 +-
>  target/riscv/tcg/pmp.c       |  14 +-
>  target/riscv/tcg/pmu.c       |   4 +-
>  target/riscv/tcg/th_csr.c    |   6 +-
>  target/riscv/tcg/meson.build |  13 +-
>  13 files changed, 434 insertions(+), 431 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

