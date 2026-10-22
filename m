Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B29606A31A
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 21:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PYif2NlX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hMxCI43Z
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xK0hD-0005SS-9T; Thu, 22 Oct 2026 17:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0hB-0005Ri-JE
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 17:51:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xK0h9-0007Pj-CI
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 17:51:33 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MHt1UJ860552
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 21:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tgof4xeQxDUPHvATTXpvhIEikVuTeNgO2i8Ax4Ed4BY=; b=PYif2NlX7XoDc+6E
 NNcnxysH0svNwW+EMqVhpFIWFNki/foOfl9F5+kEACAFHjGV7rNuMWHe9echd/2i
 GC25DAE6HiveFbBgU91BlmAJumgyTZ5bDj4dzVVYMgDtp2xF4+YDZjKYTm6kmD2d
 C2/rFikls2kJQtIoR0BQr4YZ8/4KC2afH9JTeQrZyiVn+aACaAQZ7GA7B5yQbyk+
 wOwtVZhl1UZzG6Db0NrjCRd5ivYyvpChxA/TROrmvDYNrGqknT+TML9EwWiEJAJx
 uXw5BTVncXkV5bj2Ab0EgsXF9WVLT3as/bXrqCpjRNdZfzMDayB3zCcYBYftuG2o
 t1yGzA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0h995-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 21:51:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-36637676140so425789eec.0
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 14:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792705887; x=1793310687; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tgof4xeQxDUPHvATTXpvhIEikVuTeNgO2i8Ax4Ed4BY=;
 b=hMxCI43Zsf7USNWoW9ZYKXOhKLmy5X+YcNiawNVROEsfMcPQnspX/lCWOl9gA6421G
 GhGelOPuKqqWy9lyqZWPZbMPmx8HYiSqJykhv9tuMu3WIkI42a7aRWf9NRI7jZMlH+PK
 /u81RHTqQI/F5Puhtzavj6EK7yujPgYn1s7jWo+SJcVMlVNZgIyRPhfXTQkRSPsa0BnW
 Lc1tb8Z8Qe77lxc75znM0VRnGyPEiWPoNHkKk1CR2o046I68Z6fPT2Wxa7FmJmN5h1qB
 RVrzNtz13yey2YjtOyUg+xzta0Bf6PhxydxFYD8kYJRhk8sZ3RHXJBUVBTlBT04dObuC
 7bhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792705887; x=1793310687;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tgof4xeQxDUPHvATTXpvhIEikVuTeNgO2i8Ax4Ed4BY=;
 b=VPawfOTi1FhqKa937ZZC0i5t8Y1aaT9sJH3FOvK7hDMiRAj+CnH1lx2RT7tZkcT75y
 zs3AaTEoeMnmOC5GIH5xCV2raZ07V1x3oYeM32sjnJFdxQA9NMaayXawiLbAqBM4UOdH
 cdQb8SVeWcVo3gD9MsbHYfQa5mfYZLv9MWgZVxxBwcuGydM70kxryk22jndC5xUMU7Ii
 vxp+PuBEfmTAFhJeTDmESXZx2PcN3VPuAXp9nOBDj4ILNpEU6JB+HzdmXCRm989j697D
 39TkgtOLGqmepEuUzSQ+ccTh6HW0kYDXrBWH/VhNBSxm5vmveo0SP44sfdo3nsiQxj5h
 zsWQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxFrUn84ytFZhcTw5Yvg3BANDSeV7Ve2i3QiMoDW7cFXBb3j1EjzgUAlumQDVMHEen1tPBSl1c+17Zk@nongnu.org
X-Gm-Message-State: AFq9FYIS5BXAzO0ECTFhBW8udUuzNsDi+KQ+Veq48u0kqj/5KqH1IvcT
 0xV5nNHHxD1KYJtc9feqYHFLttW7xYmnYmwwSoJRfgmby4Pofwcxv8Pno5+gg6HeLf/zXjflfqK
 3fnmuMAIxt3T1LOcWD/dN5KUagkk+SDqKqNpuV8F6fT5eVUOodRv48w2zGw==
X-Gm-Gg: AYBFou1BOgXuOpZEvUHAGPGBtxzy0bLaenm1sVAldilFj3lP51U1evAibdy1p8a7Fur
 gLMKHxcVP0fC+fYji1sfw0pc2AioqqzCzqugeasEwxjJ3J795Hb7VTVcCVEMSLCKckYt6K1wD+d
 jz99z5TUC3vzcuMxht30Kz5v08ep7DRT4/5QgP4nPX2iQp73tFaSM5Gcue/O+faVkbaQn4hitqe
 bi4MP9AhjVYsNcEg48SPoVu1mWm3v3iss056053J54PDuqLXBGh+dDjMfL8WYmdYffDYnArq7Uu
 MF8bD4dfXn5sR0H19GLuyDgFQsNJB+177xNq8i8FGbo+L3UjDIGhtkeLWWIJmRSNknGyuzjGbET
 7ygtC3gGOdh+VHisDKTmA+F5LByOvGDap5k+7XL1ra69naSbq0BrawR3kU7KqpeGGX4rcVg==
X-Received: by 2002:a05:7301:1a16:b0:358:36e5:b81c with SMTP id
 5a478bee46e88-369d97e9d05mr485088eec.31.1792705887461; 
 Thu, 22 Oct 2026 14:51:27 -0700 (PDT)
X-Received: by 2002:a05:7301:1a16:b0:358:36e5:b81c with SMTP id
 5a478bee46e88-369d97e9d05mr485036eec.31.1792705886817; 
 Thu, 22 Oct 2026 14:51:26 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369d9d5e9e2sm651187eec.4.2026.10.22.14.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 14:51:26 -0700 (PDT)
Message-ID: <97d994db-940b-4687-9596-cc4ef2f30ff0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:51:23 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] gdbstub: add gdb_register_internal_coprocessor()
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
References: <20261022-query-reg-v3-0-7ad902b9a7cf@redhat.com>
 <20261022-query-reg-v3-4-7ad902b9a7cf@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-query-reg-v3-4-7ad902b9a7cf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M3vv5Ulp-iPCp1ZBaJ7QjKOtrwmtjm70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX+DuPKOE3Gw/2
 YCaqUmmgrA+xSupJrr04d9/R/YHr174npv+8ewJ8Bf3m2O/MysUO3bIbgNJ0c2r2D+QY4mr1T30
 dH/gWbCsM6gwea+8Jb4g2p8tmMjOvC21mKGD0+I5/SNDx8ePqpP4KL/PeXBV8iCwiEIGzlnif9j
 nqGbLUs6ANHEmtQQrczcFsAzGqNnCwmx+GZRVguFG1EVhRdj8DVL0Qxlxz9sI0Vpp4rJz9LY15F
 TU0zKzRIn19C575Ibg5po2KFffvYBVhgJItOe9anWWaH3QsU8hGjn13cCzujfXzuavWCFNiuDi6
 2BGJJZxa1zxdvrrdEf1MuBGWe5A72k3C5yZ+pSKW4ueRV0weENNiZhBIGMFPiboA8QLQe5QnCgm
 qlMTe049S3UErLyM5D95yH+kPqk6N6kJ07/bjrLAKGGx6B4zmH21ix3nEZhZ/bvOskUFnk5ua7G
 GJeElqAZd/611dc3sbw==
X-Proofpoint-GUID: M3vv5Ulp-iPCp1ZBaJ7QjKOtrwmtjm70
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX4SyFCL/Px6v0
 KCYvqRY0RMDZfDsSrQ7wBvqb6ZUyzSCT2P3Mis0WJdhkGxTLg3Ifc1ISCbooYxJ5qFTqnlX1inl
 3BsyLjKGz6Df2mIbEJxGhM1+bB2hE54=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6ada8560 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=pK9UF8FOw1_8_zJS-xMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220087
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 3:56 AM, Marc-André Lureau wrote:
> Add support for registering coprocessor features that are only visible
> to QEMU's internal APIs (HMP monitor $register expressions, plugins) but
> hidden from GDB's target description XML.
> 
> When a feature is registered as internal:
> - It is excluded from the target.xml sent to GDB
> - Its XML is not served via qXfer:features:read
> - 'p'/'P' packets for internal register numbers return E14
> 
> This is useful for exposing system registers to the HMP monitor without
> affecting GDB's register namespace. Exposing aliases or synthetic
> registers through GDB's target description can cause problems: name
> collisions with GDB's pseudo-registers, independent register caching,
> and missing DWARF unwind rules.
> 
> Internal features must be registered after all GDB-visible features to
> keep remote register numbering consistent. This ordering is enforced
> with an assertion.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  gdbstub/gdbstub.c      | 71 ++++++++++++++++++++++++++++++++++++++++++++------
>  include/exec/gdbstub.h | 21 +++++++++++++++
>  2 files changed, 84 insertions(+), 8 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

