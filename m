Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AF6606A31B
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oxqFIEyN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+9XAFhF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJZ50-0000Oy-SD; Wed, 21 Oct 2026 12:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ4g-0000EP-HI
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 12:21:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ4d-00059l-0E
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 12:21:57 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LFTujg2102005
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BFo5u5dI2ZgpTXHJTIMc7kimkbbwk6iHSZv+Ud8VMBM=; b=oxqFIEyNMYTeG3F4
 PIW0nI0lNqFz89M08uVQMPYvxPyTfrXvCQyov8BcZVK5BFV0W2QVtS3AOqx97cZe
 xNYwRPBYv6Vt4DiQuOJh2w1Vj4Q7EsbidzDCZN55/hfy1x61JBxGYniY6gUJd0G/
 00bzBX6YO85UDFJqWh0AY3e7isjYUln+XGXlBlB1+zPGbJlH6klYcuU1Zr2DpgOj
 eZyzCcWFbclxV+VxGe8t3q+T/KGUW9hVlpmR59+23L7A+fdE3kN0SeNMfhNTr1o1
 4+2pQhmhDTRSaCqf/949vE/4Cmm/vxKe+g7kt1o+k43K3uMthjlczJ30Va2nSAlY
 hrTCOw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuhf4f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:21:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1383723dfddso1507224c88.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792599713; x=1793204513; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BFo5u5dI2ZgpTXHJTIMc7kimkbbwk6iHSZv+Ud8VMBM=;
 b=Z+9XAFhFNFchjv4+ZyH6YMckfb8LKdDw5g5sqfFGP1dbH7D7ei2pWHkQMZ/aLwfZTe
 FAEwmXBN0pxyP0g067Q+ySjGoQv4AltJcRnvJ3dZXj22DAqNNtkFfnWWxUpgA8dnDOyx
 53hCtQQhMOJqfzCKQG9Gj9I8SkGltw6aVuAqohH57N8Boyp4j+Kv0uEmR1EDc/f4dGsw
 5blJSOVBlsj0vFWYfL/GOkKyyYF4Vd6NQ6WUw0DColcJ3Y4B6V5nnH4Z0Kk2F6RuJACm
 cPpxNFcv7/4/09RZnDQ9DfIujIwj/WthV/UYYcrGqnVxa7sdAiry427UcPGtHNNNx2K/
 ypUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792599713; x=1793204513;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BFo5u5dI2ZgpTXHJTIMc7kimkbbwk6iHSZv+Ud8VMBM=;
 b=VAlGM5LK1maGTRPZ/dK6miZWBXP9/pxiKaKQ7RvHfzm7IPe3kOYR+S5DzJRkkQiGB3
 8cnQrYIIc8b+19r1iYmkZUmokyIuzXW/Gp8uPvISV8vsRjUrKXaIIdmOcuKsSNVi3tno
 F8CcYRFmjp4gwnTkf6YOZc+zPIOOAKur/UWvPP1U7Wm5lRcjDOAuoXP1d7D/MTO19+zy
 PP+sunklZ3DS+zoWwN7I0WtVRHXX7j964c6N5Qb8q6TKsaTalhFsvG3tYqHlgauLnh9P
 GoX/NpnmweZs/puf5lLoX4TfTjFyPwjBnxRZnMSvDyd3ICNxu7Soh8Yzl13b7aoTQORi
 Tsjg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhH0kOXOcbW80kzU783CBjfCHT5U9ji5H5WEaUuVRrmr2YgCvXsAAcZ8hQvTQC70mgLoupmoniF9KW@nongnu.org
X-Gm-Message-State: AFq9FYJaPDiHfgLB4Lpvo9sdeDLlzZPJxk3W/fIw8V9jhuwX6X9/00t8
 LbpeWE0ynYTHK84+6e2tkzirZhNvflXy8RuhCRWg2kexsvyCLe4r9d9Akzap1F4rGAGcDWv3+va
 YikCKPJbZowisMOL+xJ3rg0wSjXjN+DZF5HexPjtFcHhY6J4MrE+XAfD0U3Nydez9qA==
X-Gm-Gg: AYBFou2Psti6D/ULG4904mDFUzJ/IH5B+JRPAo8Y4rWx7fyMHXjm402e7UHDKr4rhb/
 IcwvBdsnIyF1LDbyhjXTRDY1d4uwziV4H6vf4M08+WFSLYBjGYRL5qCNSEZlcKus/vF7xnAjmpA
 AT0zledevuzlsxOYXtgOopPIjQ8vtPwAOZLqDo6vD3VYWkzC77BYSgQt6+6jeX7klPwktTBLGuO
 qfyIQtgAKEWZxVb92zBygO8JKUQJ2VGmSnZ8OZADYnHPgfOjXvx+qAENhhBnhqrFPRPkDqIgO6c
 dwrH6CL94bpHOBLSFTDf3FRUa80NugLK3xH6o3YFhsR2ZMidCReANVWLqW5UYeEkQcUwhCPU/9W
 Vht458Y2UQx0FyaIp3DTFt5mnODXY7g7sxAtIWQXPt3OMGJDJaNKJpO9tsXxkNQN9H415qg==
X-Received: by 2002:a05:7022:ebcb:b0:189:d6bf:7eaa with SMTP id
 a92af1059eb24-190a437d58emr3623029c88.16.1792599712523; 
 Wed, 21 Oct 2026 09:21:52 -0700 (PDT)
X-Received: by 2002:a05:7022:ebcb:b0:189:d6bf:7eaa with SMTP id
 a92af1059eb24-190a437d58emr3622994c88.16.1792599711888; 
 Wed, 21 Oct 2026 09:21:51 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-19035926035sm6622401c88.1.2026.10.21.09.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 09:21:51 -0700 (PDT)
Message-ID: <c68d8793-3dd4-4be8-b398-19b18baffcdc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:21:49 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/33] target/ppc: Use a static table in
 powerpc_excp_name()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
 <20261021031407.24862-22-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021031407.24862-22-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8e6a1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RrPE3oRBrgevXTNA9bAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX2Z+iEgBjatDr
 X3kORErRvvHwEWF6EuQvUgwtbmD/vzYMt+87xgF8CQchOdY+F3popIP+AWsuGOGpN4CScELzRkT
 df9r7gzIQ36/fzK5if4oOoVIsGSq9Ig=
X-Proofpoint-GUID: bjGhoIjXQCFjfODWHNtkYgD7-sv7RAGf
X-Proofpoint-ORIG-GUID: bjGhoIjXQCFjfODWHNtkYgD7-sv7RAGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX4R/6nS2srhAu
 aUJGGgC4JY+aH1FdTm8brTZb/1VezFHFKWzZrdgHM/eghnYVjBacf5t34wJDzxCWdkdr9v4syIU
 m8D4D6LHVFXMn6FUZ31ivIR+Q7cI/hHxqXVksW6B5/31ixDEWH7Qef06KivG1I2UdSrw5bQmpQx
 xS6W/OBxFqA8Tc8x0srWPx2oz6rBfx8PEHWdHWXumO2bLiUlLzZ9i3WslCpEqXNYtS/ojOitFiF
 YPvPSOaEprHOQywhpediNKzkSZE+5eHdspFhHOwsd7KZmHvk0wsLrJzIoZdsjJGS+KC5XXUnKdL
 +N26L/bUWbIzCuIZJI7QoJ5Nug3WahV3vn/SommfUCn54plglQ8C513N/E3vSktDw9c51PslNXy
 mTnSegcMPUm3rm0YFhvm2jVY7g6RjxmDWgzMLiwIJExn7K0RpTvnmI9+EvJ1eP98DL0Cr7IQuAN
 Frv3ObpVUkimqw3CX2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 10/20/2026 8:13 PM, Philippe Mathieu-Daudé wrote:
> Replace the switch statement with a static lookup table.
> 
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/ppc/excp_helper.c | 136 +++++++++++++++++++--------------------
>  1 file changed, 68 insertions(+), 68 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

