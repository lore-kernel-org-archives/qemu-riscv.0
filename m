Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A566606A319
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 16:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myuuy31Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/P1Andk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJZ4m-0000GE-2H; Wed, 21 Oct 2026 12:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ4Q-00009T-Mh
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 12:21:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ4O-00058W-2H
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 12:21:42 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LFUtAu995868
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kuGH4Mj1zCNoqyNlDPCsqdaJjEA6kVdxAiEvquw7MxM=; b=Myuuy31Q8gyQtoiV
 uoN9afzxVTUCErOybEOPkUhXjUq9Vnj7nM7RbeQy87MJCDjb5ty2xG2A4XVY9ZBk
 8w/aVMmbNf8dr2D85SQnGry8TU51lcW1XeK07W/8n/GQeFA+PrROQ2jsEdZg6WO7
 fmT38eePavNaW5Imvty2Dzkq46sVtg1KALpkxD6o0fFad9PRFhA0wU4HsLYaThKm
 peYlGJjkYYqRZenQEcKAk1yB5ezwYW6/UAhj+iXMaa7nLobfnC57pbv44pEX3POK
 HUHLuYembhbxjk8Q/aBu7Ahq9hrbB6nITEe0Pi1aYsmxFdPcfWkm41HwpBtCYYE2
 Mh1VdQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r40j3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:21:38 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-154e9d2d94fso1954290c88.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792599696; x=1793204496; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kuGH4Mj1zCNoqyNlDPCsqdaJjEA6kVdxAiEvquw7MxM=;
 b=K/P1Andkqli2dKpTvyMojDvNVMjfcLsfgxCFCrWyrftzeS6ZaQzEZRkdRAdVNfbd15
 wN2VzziYCLvzrNEqNYZeF/F+GHtx4q/Z565ZbsReRtP1prMcFJ7rbCew6vRyJSKN2D1M
 dVPmBVcdZC0rjei6UseRoNSSuk2Z7Rvj3bmkh3/OmETVfPrZQdfMakPPFXoCBNx/Rgpf
 H9+t12tP7Hko+GS3Jhhtck2xfbGKp+s3CK03iyQ6SPny1uiLTqOkNdbGg4BKbzNjPHat
 /xpofhQQzT+VMH0DvM+e4LGhIa0OGtMDAWAnNSQWY26eV6N5kSZ30X37pSnOKfXhGo80
 5JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792599696; x=1793204496;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kuGH4Mj1zCNoqyNlDPCsqdaJjEA6kVdxAiEvquw7MxM=;
 b=hRCuzUqq/guw4zoVned2NFDCeIznp+y8mfsNm3Z799MPsbx9vCx6QIZQ3O4W0cF76C
 jeYPOENT9En/xV0oStB8n4Rs41YIzH+bS5k9U4JozEj8vX8mB8hJFEa6xDrG4EHmm2St
 XkNxdu40e/sov0FwqAN+T2WDMfpQaS0GnpzGE0r3OOcSTA/E9kUJ14NWR/0SckSOUiHF
 Muf8IgghT5z0xZyXNxHSgpJQrib5Md+gVxkvy/dKD/CyT58Va6AaVng8FcCv/sfzZklv
 p1de+6e/4yN/uhIwkCn8Ddl1YtPLjYABeaFV37yKVyVkHjVkgKI+0DIxn8OGrCe6mvaR
 CJaw==
X-Forwarded-Encrypted: i=1;
 AKwUvByFxnoT11TcloCIyPjodRjx/AGtu/YLRVZMro5xtf+r3LiNcM1UAzfGMFBBGMvdhPZk6/4A2CgB+1Ev@nongnu.org
X-Gm-Message-State: AFq9FYK2V4y+FyEVGr7l0EiBP5jiR7/O6gIpBR0VDJZ1E+6RCFGV00jw
 bqCUlQGQM5Gg4nI1jqAldKyH7bpC/nlADcvzKFvetDbBBeFj4L64hk9BWLxK/PzujLeZBUT5Mw+
 23JeU4ICK/UrJDoiEnN5eoGGIDnkvKym04nezFkShvQKOLFs/M/1Hf/MwYQ==
X-Gm-Gg: AYBFou28C31sBp9nxaiTUJLvxzf0Xo3B4b3L1JRNe0lm2xWjIaW+gQ5uWtsSkiCkgWa
 LXaBABc6TZvKP+Z5+sjy80PrCD93AOEU9AXIcuGBeI5p+LOnMAHKYLzbSnECOfFTVWSDpnyakr4
 /ngTOg1IQtktScqVsww0Dw3eR1G8/geeMesb8SJho2V90AhS3jnO9WMTlCDI63JQW2jyxP19QU1
 tajw8i9o90xFSj7AYj5LM8k5pcnMRwOVCg4f/ZNJy1yyONFEkM+fa2kYGnO6bU/lr0N8TB3syy9
 bToFEK8TnaViDTk887WB3rGbTUhVAI2HgoyAI5B2l2zYZ/kLGRyHxTdIDzNL5aP0cG534m9bFmp
 //qa8ZutsDkT8dyu7B+ROTSlV/NieUVMMWlYcRSGecFDQr4LUp5GECzShMYqaQj82xRuqHA==
X-Received: by 2002:a05:7022:ea8c:b0:18d:ac5a:89ef with SMTP id
 a92af1059eb24-19140a1df01mr2133169c88.31.1792599695997; 
 Wed, 21 Oct 2026 09:21:35 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8c:b0:18d:ac5a:89ef with SMTP id
 a92af1059eb24-19140a1df01mr2133110c88.31.1792599694879; 
 Wed, 21 Oct 2026 09:21:34 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1903bd6b7ccsm6747992c88.13.2026.10.21.09.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 09:21:33 -0700 (PDT)
Message-ID: <b19a1fe8-a7a1-4089-9b25-9e4874d2a89e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:21:32 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/33] target/sh4: Use a static table in
 sh4_exception_name()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
 <20261021031407.24862-30-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021031407.24862-30-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8e692 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wQEKYDyfpQnk0JwDFccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: HPva4r5-AMdjX3W6Io26oCfyShU1VWNx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX0YCxP+g0x4TE
 5J/bTCouuYqbS3X2A0AYwPDJFPpyvh/z+zS16KPZ+uo2d/8+w9k1NknJqlW6ED5CeLf0KJ1qjU/
 9bBhfdAZ4CM7QUzjqy/EMsWeqkyNj142X28FsQ4nD+wniEeLTVN6ck4P1A7dQWV1we/qXtVmewC
 L4xr1K4SzrxysDIrIvuL8RFz+pcEnrS7F0OF788zbXyA7ZlWWFWOVipPDVFFXwbG5tI4lOOanEo
 nUVOKhSEmln6R/S5EMVx/BIaFgruLUAXwi5EQ0ON6cKQCpEOKm8/psen3DacNOt89zf0jbEj6ji
 lx7xH1RT4VEhh+bqqCM1Udk2WbigKxyo43unp/b+Qxu1cqm5qecmG4b2hTsb+p2vNMw5KyiHKQB
 0OHfkBWGecQo6olSwj7UMlnk2FQueqKEsY5EJ+ou7v/phnqt2zdB6Bs8V/K3WNMSZle8zlCtPeo
 SzXNX4mHhAJhz6eU6nA==
X-Proofpoint-GUID: HPva4r5-AMdjX3W6Io26oCfyShU1VWNx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfXxjLPQpgW894u
 zKHmGr651whGcvA028EvqmMr9fNV5qcA9XQq4eZbGO0yoGrqM67Jf416wvE0ZUDPRZcVJ9M9Smj
 3Ain+pU87nfXJWXA4VOGlJ4tMfNKTZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/20/2026 8:14 PM, Philippe Mathieu-Daudé wrote:
> Replace the switch statement with a static lookup table.
> 
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/sh4/helper.c | 65 +++++++++++++--------------------------------
>  1 file changed, 19 insertions(+), 46 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

