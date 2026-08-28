Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4385C61DB9
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 07:16:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzqp4-0006xD-7p; Fri, 28 Aug 2026 03:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzqp2-0006wk-I2
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 03:16:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzqp0-0002Lz-RW
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 03:16:20 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67S66tKo2515330
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 07:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I/OBV2qR/Dnuar0XWg/+/c9gtv9v3h1uZMH0PTJbcfo=; b=oXgCXCoQM5r+sgRT
 Z23jAzkyJjlEGWSKKrfX2axl/ixW0MWEGd7FzXOMHJyWdrKnT1Nbxrwzn692QLx/
 lbtCfQ1vby7PiCyjKfyzoCnsOFu5ybAf6P7kmsa4Tdx0EY5sMspLA6LWyBXg6QKu
 TjV4quYJv20zkCz51OXBgyy+owFzEm+p824rGLjEezL8g3DZs90zr56hxwsjKbxz
 LUJxmYgAVcvjrgG5ANITXhZwFrARQfh0QomlY6yIlTfwKYVU6jFHRaCvhUjWw0bl
 MoJmf2Md6V0EF9jKT8gK5YyiW7CbbYG3RCxN/WA2WiPh8OVIvVTEqHnj5nqmRqb7
 r99mWQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n0csm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 07:16:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-90cc540a846so8467166d6.0
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 00:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787901376; x=1788506176; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=I/OBV2qR/Dnuar0XWg/+/c9gtv9v3h1uZMH0PTJbcfo=;
 b=GLIYXyB8oZupgvmfdC+awNIJju9z35Qtrz4odhp5Hgt991TGtyenr7BIzPAmvVT5KT
 o1FUAeG0yde5eX4NON8QalyMgRlSw+7VtzBig0at/dqX39JVQrXX5+hHkY1ghXTDGPN6
 fDTX2ftTdy7wCXSgwZ+2D+3L3NvwexGsUU2tOZS9H6hvvIUWXTSfiTFmC5s5x6QEh80F
 oX4Ox7wGRg6NZG8mvkJAoIdRILLf1n1QCSwZPbvZcd/fM58nDnfAqDPT6icxkFYUV41r
 7zML4DVPJFzkrpJHWm/hR8PUZekOF5u7ZsgM403Lp8F8hxfFkSof9NXiKPqZPfMLKXf6
 QwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787901376; x=1788506176;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I/OBV2qR/Dnuar0XWg/+/c9gtv9v3h1uZMH0PTJbcfo=;
 b=WkX699uKssmNBqUNBZPzcWjoPp6XTE3+QqRZ/szyuIDCF/dORmo8NxukGmAyzqTBPt
 aA/NUskcyRPsohcenitWJxx656qnfBZaSfKB5M4NKlhhLk3PwT3Yabu6bZ/s8cXD4R93
 4o0CA+o6/h+XQwtpuENy7MVoEQcHAm5EIqegDvRHlAoUvMjZyZLaRmDWW+caOMpjd8XG
 t5kb6W5jEbG/COJwwtTodE+MGjYbtqQ8sD6zD9ZlzMKbHJQAorkWAR9Z6eC8MH0pA03g
 fzhDXAyBGVGQd2pO1Fw8zxWiK4W64Yp4eN0PuVuKh/lWj728O1HLYMIsTdsTWUCuiSS9
 VSRw==
X-Gm-Message-State: AFuF++lXjjp16CbOLfp5DovrZwLB4ylLwe28H0MRMahFXc0KF3BfDtrU
 s6sdHtVv6SwQFUYG4PNAb0PxXTQGIMT8z2eKP4hyCJV9an9DLbDcuEpQKWU3cV4FOmxG9y8qJol
 e1mRueNqSJ+3tWrl3HZ/1i716/oQwoGvEdUmfD3r4KZidTFGX4/BatumyNw==
X-Gm-Gg: AR+sD11/swybV5ndmyLIZG7wwpAAOH6Vdx9sPTgfvPCzFpy0TDvKrhHvSxpUZ93OdYD
 gfDpTcf3np66xIauHOsMXaoeT7GBRZE0hK3he5rVlKxdKJtqTJo+BZxcmQri0dJUZd5Xhq+I3yV
 u7gcfnIR5AXZvpA7ElR1zo1cw4SyDiDpwuoC7rqm7TmML2S2aexpk42Xi31dYWvbeZTGa7zy/Ah
 /ahsn0PSaEdz5FwN5WQ5/lpNvCX12MzB+2ufQOwPVGbgiGqcRrU0eQEUjDOHkE1eQAgsl2ujYWq
 0A7wn3RVUfiTVGQsh5OotdHNQDV7g+uy4kRBnSDwmetPMabLPtbcDiUpzPZAu4Bw3pZeeKlTnq4
 Sc/BxSpZQoImkW5+JuhVINqe3MAd20uiDrw==
X-Received: by 2002:a05:622a:40c:b0:51b:9878:8242 with SMTP id
 d75a77b69052e-52fb93b2fb3mr47257981cf.6.1787901376160; 
 Fri, 28 Aug 2026 00:16:16 -0700 (PDT)
X-Received: by 2002:a05:622a:40c:b0:51b:9878:8242 with SMTP id
 d75a77b69052e-52fb93b2fb3mr47257581cf.6.1787901375725; 
 Fri, 28 Aug 2026 00:16:15 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4e2c1af7sm108740365e9.15.2026.08.28.00.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:16:14 -0700 (PDT)
Message-ID: <b1102878-fbe3-4881-8d0c-a91c4425d462@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 09:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] hw/riscv/fdt-common: prepend helpers with
 "riscv_"
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Joel Stanley <joel@jms.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
References: <20260827222608.329788-1-daniel.barboza@oss.qualcomm.com>
 <20260827222608.329788-2-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260827222608.329788-2-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a9135c0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GtS8KpC4QQmZ-MVVqrkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: D34JGeq1wBpaDEhCzT5ilZxxg28n_1h2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2MSBTYWx0ZWRfX5/vQjvCMi5az
 wVCrNaKq/p8TJ9qOyESQFTX+Q+coxViPDmbPJX6p7ER2dKythVyfHTNLF8RQhEP2QmCHc8f1El6
 5vF3Zx/cgrwtY85QgKc2IeFBJhXXb0A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2MSBTYWx0ZWRfX16P8/+ndFuim
 x5FdjT90ze8A5I/kUqqxM0dVnhdHBNtST+04nBi1HYmUtSUu3kPTwsglKYJ5W+fgZPCZhi0VYz6
 2JrmOyTOTSHR2yREhq7lgGwzIbcVNiyxGobgwlNwZ2otp6CyOhnywg3jXsCE7hf/xoUdgsZUteK
 vtC90QvUXu0rNv9YKEEks34228xCVy6SjBPWhLEoAGxINZHQSnHL3kway7/N3V+zx4SrwoW3TD0
 fVsEmdQduZFYS9LZMGlf2N44t3GRBqMdpxfTpJB1sAzyL8bSWslmBP/z+DnQJN+B7fF3r2wer2Y
 sxo+6RO/Y2IT2/2YKqTlZNq5kF1fSFXrFI2EzIe4Klb7ilPAnp4+OBp4HcmvNB9uXExvjh6koR+
 fAumlJbmnhofCmP23W3qneyhapDwVTJWOfprsnyggqW/Nq2uttzrID/h2S2C9fkcrwjIJsfT4gB
 vhGlPsI+hx/n2BX4t2A==
X-Proofpoint-GUID: D34JGeq1wBpaDEhCzT5ilZxxg28n_1h2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280061
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 28/8/26 00:25, Daniel Henrique Barboza wrote:
> Given that the helpers are public API we should prefix them with
> "riscv_" to avoid conflicts when linking with different targets in the
> future, i.e. we should not use generic names like
> "create_fdt_socket_memory".
> 
> Despite the amount of lines this is a mechanical change and no real
> FDT changes are intended.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   hw/riscv/fdt-common.c         | 45 ++++++++++++++++----------------
>   hw/riscv/sifive_u.c           | 34 +++++++++++++------------
>   hw/riscv/spike.c              | 30 ++++++++++++----------
>   hw/riscv/tt_atlantis.c        | 22 ++++++++--------
>   hw/riscv/virt.c               | 42 +++++++++++++++---------------
>   include/hw/riscv/fdt-common.h | 48 ++++++++++++++++++-----------------
>   6 files changed, 117 insertions(+), 104 deletions(-)

Thank you!

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

