Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E61C606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 19:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KcxfJZek;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FSoxcT6Z
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVUp-0002XE-42; Mon, 09 Nov 2026 14:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVUL-0002O2-Sj
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:57:12 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVUK-0003vw-Cy
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:57:09 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHH4X899581
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 19:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /QJ1yQZXUdHl6VLmD98JD2CL7LZGLN4++AjAtaBTGjo=; b=KcxfJZekmfvdIh0j
 IjwEyKvw3yAwsRY/YuZmQh+B+pVVRliOFB1Opp0ZZ2PDzH5e4m4RRd0L0w+nkKj6
 MZudqfCgpzpxMcU7RfQHzHzQuzNRwsitoMlQqFvopTcSYbJ79s4lDLtSZBXu/SjX
 znPDLcjcHkvYEuPT4UAMEtsmVCgsjPU+/0sw0Wu+131urgtLgxZ01rTlJ+L3ieyS
 /BXsv33oF2UUWi60Vkev16eALDxL7YI4KO5iTkIqYxx1LymyAiJHnGOKY2CZ7Kct
 PrzMGeHaFS5TvZlDlaHsHpvDDeZ+7aZ+OAWOnI6EsDDN5o0C4V19fNM9Yy1iCcYk
 4JJM8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2kbae-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 19:57:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93e92aad34aso323414485a.0
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 11:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794254226; x=1794859026; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/QJ1yQZXUdHl6VLmD98JD2CL7LZGLN4++AjAtaBTGjo=;
 b=FSoxcT6ZGgrFmGUZBYxGP3d5W/4pfEQvwueKPnEvg5XIygLF09qZnwFolmbDFm665u
 EMYza8JS0DkgfMg9ssx2Syt1I3qnrEPkfLMLfZR09JFqv7ErREzgr/2xMK/51ImExkV8
 w84Q944fzc8Q1U1GLWfzMStTj5cau9j37v9xD2g0a5OIkt6ao4OKBaNdOZSmIg4c51BE
 8B0CoXefrsAg6q1nP6KOf6BA22OuY0El5kciCltrI0B0RED77vUsLjQ//7qk4lreY6mX
 KyfARUn1s2uwLgfZxFFe8Ttr1YUqlA3jvt8Nb36RpPdILv646MthkqxsnST+0bcOLuVa
 O8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794254226; x=1794859026;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/QJ1yQZXUdHl6VLmD98JD2CL7LZGLN4++AjAtaBTGjo=;
 b=dvwF4ezWSf/suhO5oo0taBkUMf2w2Fis76Au7DbJdVhYfY8GZ0w1/vELo9i8FAxQEg
 0z0MUo2kdd6+eAjjznUzt3Q9hZlstOlhXssEwFeKhNrnuf8gnNrDuw+AjLFtIIvLazie
 hs0BpdF5esz2+X4+Bm5Odh56WpiYLV2BZyl9vWZCSUor+zFTMKE5Dh/gP9+gK7iUinYL
 Dt00hmQFM4nj9aVNayZBuWUQVB5vmuL9B9TE8j2vSgHPzOu4tuHn3UUHFvYF9gb3n2s4
 UtLjfT3/+LmoC6+fn7Fhuj5FaZotvZ/JRQW+qUqRpdiOnf0k2zNHzpBtXbPCVHb38lR3
 7GTg==
X-Forwarded-Encrypted: i=1;
 AL+hErFO/ceFue0ifWi9BcA4sySegB+025y1sbd4LGuZijQYmImPyJYAzkc+FxOh2a4Bxq/AZKm0IdFpqfv+@nongnu.org
X-Gm-Message-State: APuU4Z/T9wor+NyPfrLzGLMRIvxCbQUmG+KppqeDl8QIpY+xGuXrJOcX
 G+cBHKdtNgMfHNvagiPZ5BPDo4reMcCg6aAKpsdKqM4GrHcQPPEJWD7wpebnkEUMcog/WUj09Re
 2UpT9VESk8H/7s/d3Ke12CXfsp12ioK+hpxBTuMDulkl9acAtq31ptFQ7b92tlgz7YA==
X-Gm-Gg: AYBFou3nbbVqsFqjlaH6LMmhY9M3fpmHV9/06n/euuk4GH6WyUmmxgPVlDEvdFOgheY
 dDlHB4yJjRvPfDm5f4mjtUUVou1hSkUeT0w+mnAQehx4C6xQzbnfaSUbWLo3EuGiPgSw/qj3fHs
 lV3vz6vKdKaeK+xfHmLt/MWX0EJn7y++mktggrSE5vuBEe7FvKtRnawHChyca5HBapPNnTW4HmS
 LcCkzh8fqdnzarJzVO2ZSqpcnLCNoE4dgLjtWKD+pSpHNanvDns+zWyFIHRNqnNeYfZxsCyl519
 vG41uOvUkCvvmphTBTNaSIl1X3np8zd5uKx29SOL8DgpbnbT3+8Bzj3yvA3b6pBR3R+/y3+j0QV
 izmVkgCIbx14QViFssTHG3zvtotxoORawSYYhMrOexXIV8FDHm8715/KfXra3CX1EgUZbt/DZ39
 N0KCt6VeH9
X-Received: by 2002:a05:620a:4049:b0:93f:5717:e7bf with SMTP id
 af79cd13be357-9479f2fcbefmr90613485a.46.1794254226432; 
 Mon, 09 Nov 2026 11:57:06 -0800 (PST)
X-Received: by 2002:a05:620a:4049:b0:93f:5717:e7bf with SMTP id
 af79cd13be357-9479f2fcbefmr90608885a.46.1794254225924; 
 Mon, 09 Nov 2026 11:57:05 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e785557sm52335585a.19.2026.11.09.11.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 11:57:05 -0800 (PST)
Message-ID: <fe869235-3586-4dc7-ad4d-7f2e7d8f36d5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:57:02 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/38] target/riscv: Add implied rules for Zvqwdota8i
 extension
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
 <20261104194155.679241-6-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-6-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af22593 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=zapYC8F5DdXOOChKbMkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX6CWivgcW3D14
 UwLCAY6fFZZzvSsUQTxhcOZnND1h9NvP+04hHase+0mh5RBwn4jmxRW/kFEMazPZLdHDGg66EJI
 ENHh8i4McbXsTh17/MJxe/sAloI0BBWU8Y/vyhOF24HV1p3+YP/NedM6c4A+F1EHwQhl1Hbaqyf
 iy60mHefPGc1CrCCDGDDs2AVlyVMsnOutfEM+3nZ25J/4zdPQfFE7OxjWTEt+iegm2hu7Eh2S9D
 nxmyiCzMszFUWS0b0IkqPtf8qF8cIyczfulmYEUK0MxPRX0OyNUy7rCiJCXITl8NdL6xzk6LJ1h
 TAoN1wPOz1CKIIUxaWnVrEtSNDpkeQhAnAiUDYUukd76dFP9VHHsPKbBgRB8W4Wkq5O1HwfjiiT
 lh8cv2W2QUOrNECO5FaNm7csJNyZ/EemV4IvuGzhcmP6rf1NiDoGEkw810QrqoNZ5utQaqOXctp
 AWy6pTr8JcxC9jzAniA==
X-Proofpoint-GUID: 6ipTxdrL1oCH2kcp8unSwpxXiYUR1W2Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX7/tvUYaW7zDF
 pqt0P+OpmzP3tc73ngWQbgjIoMKsKova4ijqG99N8Zhm34BtSLpPISjJYZUN87SZUVrkSX2Hvso
 /9H8cV5t9tES2rcGMUUzk83Zb8lAr6Q=
X-Proofpoint-ORIG-GUID: 6ipTxdrL1oCH2kcp8unSwpxXiYUR1W2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090078
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add implied rules to enable the implied extensions of Zvqwdota8i
> extension.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 96a1d76c5a2..08b14782451 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2851,6 +2851,15 @@ static RISCVCPUImpliedExtsRule ZVFHMIN_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule ZVQWDOTA8I_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_zvqwdota8i),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zve32x),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   static RISCVCPUImpliedExtsRule ZVKN_IMPLIED = {
>       .ext = CPU_CFG_OFFSET(ext_zvkn),
>       .implied_multi_exts = {
> @@ -3055,6 +3064,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVKS_IMPLIED,
>       &ZVKSC_IMPLIED,
>       &ZVKSG_IMPLIED,
> +    &ZVQWDOTA8I_IMPLIED,
>       &SHA_IMPLIED,
>       &SSCFG_IMPLIED,
>       &SUPM_IMPLIED,


