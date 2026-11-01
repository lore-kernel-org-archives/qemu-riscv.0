Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676F8606A32D
	for <qemu-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VRipQ7VH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uts6nYAf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNRv2-0001OK-RG; Sun, 01 Nov 2026 04:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xNRuz-0001KY-7w
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 04:32:02 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xNRux-0005fW-Ni
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 04:32:00 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A18KV0A4190433
 for <qemu-riscv@nongnu.org>; Sun, 1 Nov 2026 09:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oOZtN8Fil/MjYVttleWqP99VP18KjK7FwDMixfhgVFg=; b=VRipQ7VHvPIjPH2C
 O+bcbpF/1Lqc02byAzbpl+mEoqNxyvqDYWe2pdg87Wuhic3H+PUhnAvIqmofeIEN
 2mOO8CA9gxHhalglySGE3vWdQx9W4Io1500IU5LfFInV0zhqSs+HNrjo4Cgydb40
 mUlvqldaBLomRxtfUDgIx0zUA5BdGqZqwrwuy3PdyXAiefY6optGKGHhiecftLjH
 YNV+QL8jPXxxW5d4G9A4+rfBUv1hItnEXDXoC/ko+MWB1dpo5eLea4LUCXZQ1qiF
 4qxUFQFjX4acTX0UyP2oSzpSgwI1A7ilikyy9vRDtZh4CRxbbtQbGYwNNhLGC1fh
 AvRw8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfu6jn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 01 Nov 2026 09:31:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93caf6c528aso298533085a.0
 for <qemu-riscv@nongnu.org>; Sun, 01 Nov 2026 01:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793525515; x=1794130315; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oOZtN8Fil/MjYVttleWqP99VP18KjK7FwDMixfhgVFg=;
 b=Uts6nYAfcuXN171P8R2VpKGa+WgfryaMNyOhzJ/dM4IOqpqE8eh4a9bcBtKfHQCp0Y
 J4uL4ATa8v6uMJIIhIaf5dN6/DluQRqK0oOWHC2oLMbvw+ZQGm04E1/Dix7LVobq6T4x
 YQ8CWlHAMvd13aN9/fVi7XFHHm2kQghQ0OsUkoTJ4nMxONF4QlEx+MH4ka8S2RBnGPRf
 sTjRJPNTCMojP7b6UkwYCTYwxRDXBzhGbUHullCmnUSGP5GYsu0WFCeDIG3VgIFFv+ii
 uAq85Jjp7r9Ys3HZwlwWT+BkQNXUd3Xq7uuSbUSbiWvnmeZxZmK0/vuIbT7VJjn3bVod
 8oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793525515; x=1794130315;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oOZtN8Fil/MjYVttleWqP99VP18KjK7FwDMixfhgVFg=;
 b=kTPcPduXMJtK0OBkv+BmvSwZigR1CUNYUfDG/09C/wFCG8m9DmGPuqYhnkgkJiskPP
 Qb2celJeKC8giGFvHLxBqUO1NUAmqbP81biOfXYXthX/jVwoq0p4m5tDeHlHXIe9Oxm1
 TCWgW8F8IajHHPZAbjcTDeaY/4vVtNAX01cnf3lGGty9fDeYMAFjXSi4pZfdE/mVfAZ0
 w9XUSADu97xZtxP7XlHE9hVfpwG9Ki2WeaW3vzrQO6OmqaHoYzezeTKQBN6e47vtDcsm
 MAkhLwTy2EA0RQd4LFLfNChLyt8TAzEmnpVRFIzsKh7/6FX8faQstLeQoADBR+xg0HoA
 umBw==
X-Forwarded-Encrypted: i=1;
 AKwUvByv8wsWT3UKa+0iHgRok8R1XSzEafsVGosJrt8iNm+j8xu3lpE7dKhcaRUa1jUEdTk+WhWToYJleZgI@nongnu.org
X-Gm-Message-State: AFq9FYKs725tuE2oMUEMIE5SYq5Yz2nfh86GeX0hjs0l46LdGNBeTaOZ
 v18wYPuzyXpPznRzjkpNjOPp4PnL9L/Z3/OmNwCiZ4RGGwNkjhAiTpGcQrXZj2w6psDwymoHwJA
 YVLqkty9rOH4OB6A/NDApxCtmlL9Wi0dSaquE4gjujSVWw5sHruWgyKkyvA==
X-Gm-Gg: AYBFou0yfWXHk6GJ/JFX8Pq55ndn9C7zSUa2YrcKglrjY1fklTn+LC+VCri+mZkOTRv
 bHA6LkiIyADJWXbYGtuUmofdHGTpAw9ypuaPhUGVeZ71ODfD2l3k8f8RJB39JR9DNJJilsUGbVJ
 z3r3ldch3RXoKn6GrKnY8we97UkJ5CsOG0acSpst8MgncHMI8TRxbm6dcLZBepvUP6HdWZlGq3y
 W9qjroMkE1pAnv88LLgeqkCp4QbtB4Ti027eQ8CNte76pSdtCGUS+b72ZAErmH4CznBLgwnwY4O
 Lt3R9kcgrVqp2GiEmG8uNEZv0Y2VHiXgdnlWbranhB97ok+kCw9cJcpJNthOTZHWntu7V84eJ3D
 z+8OdacQ8dKxuDXt6Djssy29wCXQfkmH3siQn7juGoBaSu11kgNft/WHGkZj3mZ5RccSn3+pLgr
 NUHmcR0NPm
X-Received: by 2002:a05:620a:2696:b0:93f:216f:f404 with SMTP id
 af79cd13be357-944216bdeb4mr1151767785a.40.1793525514662; 
 Sun, 01 Nov 2026 01:31:54 -0800 (PST)
X-Received: by 2002:a05:620a:2696:b0:93f:216f:f404 with SMTP id
 af79cd13be357-944216bdeb4mr1151766485a.40.1793525514237; 
 Sun, 01 Nov 2026 01:31:54 -0800 (PST)
Received: from [192.168.68.102] ([152.234.122.251])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca8088581sm62156386d6.44.2026.11.01.01.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2026 01:31:53 -0800 (PST)
Message-ID: <7a8671e3-add6-4fa7-8e1e-3b94071d4677@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 06:31:50 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/27] hw/riscv: sifive_u: Correct the L2LIM maximum
 mapped size
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org
References: <20261014012323.322790-1-bin.meng@processmission.com>
 <20261014012323.322790-7-bin.meng@processmission.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261014012323.322790-7-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzNyBTYWx0ZWRfX/jAvRBISr+97
 svfwnzDSeawPn1WmvPyppvw+SzQXJeGmTtzyI61pzdsLzxOF6H9uwb+i6sI4Hr/qGNFbzDHQQ/G
 CO34716tIv6bXxBjuSp+uZGyk6kf5pU=
X-Proofpoint-GUID: z97WGnT83Wjpo061L7WntBu6Y68C5-T4
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae7070e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=QOY8BskYDu05dfarAz2gNQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=FRSEYCzRAAAA:8 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=RANoeU_kD-jqrAgHIL0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=H4N_Y-AU75W7NKDNhZlT:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: z97WGnT83Wjpo061L7WntBu6Y68C5-T4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzNyBTYWx0ZWRfX1jf9tssWVcms
 QplkJf+LATdCgUt7oWRSHiRrOFBdRJ3Xjib76/9+3+Or1qXJrh4lMEc3BGhGeVoeWmKuxQNMpK4
 mXnmz+qeFmaNH8bCq55fk0BojJ4CCmkegjIFuGr3qS+mfN41bfGvndENDKxPJ/es4LrgTKPueHY
 DjzHEGnLq7hVB1aiPAcyfMQd7k591rewLl1LfQWBzLZQ8MFgzEXceZuPFI7ZYH3qgWEMaEffuGA
 CpzNAO4yqB/hhOJPzBDPy+hn9sWzowR0U4/S6l09S7MYUSl9wuZcbn6SPelUHawySHUDisTg2wP
 o04YtMe9opc7r2jVfk5aMHQ8k9ocwmtc0ipnFkll3xTEJkuwuSnPbWgAHReZ5kaY1FD+oycrS5f
 RPV39fmQeU8GggSZeQDr9+X6v88RQQV79pYi8KCoipD9SAQn4HYdvi1V8VlDAC3nfvC3Zm5qpkO
 paDDWTocKEtdk1qk7SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010037
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



On 10/13/2026 10:22 PM, Bin Meng wrote:
> FU540 SoC has a 2MiB L2 cache, so the maximum mapped size of
> L2LIM should be set to 2MiB too.
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ---
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> 
> (no changes since v3)
> 
> Changes in v3:
> - New
> 
>   hw/riscv/sifive_u.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index b7d5e7b4da..1ac0d1bbd9 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -72,7 +72,7 @@ static const MemMapEntry sifive_u_memmap[] = {
>       [SIFIVE_U_DEV_CLINT] =    {  0x2000000,    0x10000 },
>       [SIFIVE_U_DEV_L2CC] =     {  0x2010000,     0x1000 },
>       [SIFIVE_U_DEV_PDMA] =     {  0x3000000,   0x100000 },
> -    [SIFIVE_U_DEV_L2LIM] =    {  0x8000000,  0x2000000 },
> +    [SIFIVE_U_DEV_L2LIM] =    {  0x8000000,   0x200000 },
>       [SIFIVE_U_DEV_PLIC] =     {  0xc000000,  0x4000000 },
>       [SIFIVE_U_DEV_PRCI] =     { 0x10000000,     0x1000 },
>       [SIFIVE_U_DEV_UART0] =    { 0x10010000,     0x1000 },


