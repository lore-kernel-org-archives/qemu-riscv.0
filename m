Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E942606A31C
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 23:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CFnjsenY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwqSJ80b
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT65i-0000TU-W5; Mon, 16 Nov 2026 18:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT65f-0000IY-Uh
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 18:26:24 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT65e-00010g-3i
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 18:26:23 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGNQLVw1391145
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 23:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L3gRUxaU7+J9rICz8CpKtnuNVQuuYC+Z2MjUNOJiB3g=; b=CFnjsenYAOl8XlvG
 I44qov3kZTe2un41+fRtEoGD5k4plwi6/P34+djMWTpsPfqqvgXWePPBv4eIOni1
 qG939PI05i8z6NVE1cYEKRrdfhMJTVuejVncsHr6ZpzNATa8XUMTqk8VuklRzyFy
 cs0TXbvUYQJUCbcC5r9nwBV64a4PaHxo2qbUj8hC+piUgRsiGzvcoEILRX+QxkHR
 YnhG49P2CD7neMOY8a1YXatQuC0bP8+qjYGghunFznXHuLytx0SUsBy5aYT2GrTy
 u1em5MnlIKrfq2aJCe57SLnjMV+ag6FtO/wqy7dljJSJDgAjLtTUz1D13y/xeqyC
 csttoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y25a8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 23:26:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93909014c85so367039785a.0
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 15:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794871579; x=1795476379; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=L3gRUxaU7+J9rICz8CpKtnuNVQuuYC+Z2MjUNOJiB3g=;
 b=BwqSJ80bHyiFYkCteDH7Vl7H8//g8WXh8DyURgkDLFUTE58KgWP2PEi+9QyJeCnPox
 UqkPDJLuazgGiAFz6RfiWH60/XXPYZ3O5QlvsgV2LBdkOtAd8rVZ7HcZA2cvZozsXF/a
 RFyRuvaIw4VW07oBt4hAcQqj4BaT3s0mBvsHRjswG+QMBh2gZ8pBcks6gzy4eH4jl3VQ
 PCMXpmKg06oYh7hB41fPGPh+NXcRIDJFlHKjEbnDrScvEJ8Feetvvwg5ihEDLGM/9bNW
 3ZCOIlBCGVxlDdAwZP8pUjaOrj7kjdbMTUxtUciAIxJ3prrcgoponrt/qWrj6hJOb3px
 th8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794871579; x=1795476379;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L3gRUxaU7+J9rICz8CpKtnuNVQuuYC+Z2MjUNOJiB3g=;
 b=Hlj4Y7SbmkUpob0o0vy7j8fCGXIUAmUI74TEkWZHJ+Y98/sHY7K4fqScb0VKaOw9x3
 krPfiNuaKWEtFpW+8CNdMXXBCxcZ1Ihf6wHYmO0Swz3FLPkhKZnrY0xsw2TFI2R14rmj
 VMVX5Au+wuCRsSZlpbSRx6ahocNvGFfXSQ6VAFnb4EWhEgfyN39z6llpXY2pDOhpZRN/
 dFyuSkMTtGZb6UhFAtJNtpSieoVDbVMH343ELCj/pOKsHAKAC7PRfE4vyD4G4yMKWh2q
 +Yap0tw3cqda0RUxriFcT3uWIhDnzDL0N0PdlPZDTTjMh50RoBkT154hoxxoAyoxj2Up
 av3g==
X-Forwarded-Encrypted: i=1;
 AL+hErGNxBAJUyvCiWLZHBna2kOYwGasdGd/L+ekLlmXBgMMu8vVPyvqVGbquB5J+pGSOez8IIblcND8H3Uf@nongnu.org
X-Gm-Message-State: APuU4Z8UTuYUd9hFg9+wwO+90Z0lZfY948VM5sTLWbDwvssknhRjavlR
 eC1saA6fneY6doh9RyFY10RWDsX0mHGP9NaaoDW7o9tZPCy6OGfQ1I5HhRkzXgbMr3g4hmVxBNe
 imCU+y8gMwA9iHtAMtIbf30AnZQryUIh43RtuP6XysOt3pDFy5m/5qqTeeQ==
X-Gm-Gg: AYBFou3/frSafJ3p0WC6jwtsN61oCjtQbFWyY+LvV1Z7I4muPmXIX5rzHiXbJNOujl5
 2uG0prHLvNRyS+87QBB+DALeoS/tgAYQN91B+MHT7QPArp2EBVcpV7M4Oo7AHFixyCBaC9VxbjM
 du9bhzN0n5t98KSZg2uI9yPXCXhE/VKDrDZc8VEnPiexad3RYPR9hyGXNto2miDp+sb3T1c2tJh
 k6VTiH565K+J9xcb3/8qF70da2lsmMxfp8ntn9BUvOCVhSSuW9fqodafsK8p/HCCXGysK+YNi3X
 5WCxW4VVLcmpZlqtUgUpHpbKHodLhFc7lh9LqvFs5pGJFuvD9NjaoWcZ2NfsYZ4Y06Dh+2VTQCT
 gWkadAYUyTbxKBQXJ5iP4/l7DtusDS07LWrKFjGUrX2aYQ05SekubyGmO3McR9K+nsW/hLUWMB6
 lSwlSRX88=
X-Received: by 2002:a05:620a:4693:b0:949:6e15:e1d7 with SMTP id
 af79cd13be357-9498b875da9mr207359785a.25.1794871579205; 
 Mon, 16 Nov 2026 15:26:19 -0800 (PST)
X-Received: by 2002:a05:620a:4693:b0:949:6e15:e1d7 with SMTP id
 af79cd13be357-9498b875da9mr207355385a.25.1794871578734; 
 Mon, 16 Nov 2026 15:26:18 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c888b90d4sm24595241f8f.9.2026.11.16.15.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 15:26:17 -0800 (PST)
Message-ID: <9b65adf5-f208-4e3c-966c-e17f7228a284@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 00:26:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tcg-tests: detect redundant exe_name/test_name
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261116232140.2758664-1-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261116232140.2758664-1-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x8h8WoPh7KXc4XFKISHFN0SaiKwnwBUW
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb911c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: x8h8WoPh7KXc4XFKISHFN0SaiKwnwBUW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MyBTYWx0ZWRfXw40CQ/qXcf8e
 n6L3Zv4RbDKfDp01tnVhtMbBCAuD3rWdcmmPktCqE7OjAiI/eY3atVvtLukUBQlAMlS7izP8oAo
 JK+mKHc5COIjUh7DSc8DbNmYyzJCXRM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MyBTYWx0ZWRfXww+F3tZEW4i7
 2WbGc7T49bc7JABJyuOL6Cb6822odC9LwFHgnUJ7QzkMQHNpJLDHZwarFqdEk2LupbCvxUkv/Vp
 aLmpDBiDM3M9fSXyl9F+vNsgrxoF3fydATuiDtnHOBzgQRa5ZojTPnN7M5b+eLmgJg8r/VdN8KO
 Ht2qUdCiXYCO/GU6QVmZWoNisZGT5CyX/ghxL66YZtqpoiqEfuc95FoR2lMda6oC6HEYy7T4q2e
 3TLfqos8TbsJRNWwsIBDan0Xn7zSJqIItwVPPE4qhOxWBPMr2WhMB65D6geM/X6oADDhHAmat2h
 lbQmHrUi3Nn6w7U7cfCdwsOqinCbfBYc38L3qhH7qAIG4K37qMudWT9qylCZojRe1ZJZ+YiE/1i
 dI9AiRsnLNzeazIaKy0XZZiyWTekJn46QiVHuvYa4F5jRVQJxJx+5ieKaK1L+WqDlqUdpvdayQE
 /lHHDfyuV1xK6VcFGNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 17/11/26 00:21, Pierrick Bouvier wrote:
> Detect and report an error if set exe_name/test_name matches the default one,
> thus explaining to developer it's not needed to set it.
> 
> Pierrick Bouvier (2):
>    tests/tcg/riscv64/system: remove exe_name as it's already the default
>      one
>    tests/tcg: detect redundant exe_name/test_name
> 
>   tests/tcg/meson.build                | 8 ++++++++
>   tests/tcg/riscv64/system/meson.build | 1 -
>   2 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

