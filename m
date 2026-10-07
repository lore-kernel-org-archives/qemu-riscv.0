Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174FACA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:39:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEP2q-0008EG-3n; Wed, 07 Oct 2026 06:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEP2m-0008Da-6H
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:38:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEP2k-0007zM-IY
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:38:39 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jR3h1873335
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S/jMN84BbNEg9gZKA9tCtKcPgGCUe69FH2FfKgWcd/Y=; b=YKNaQtnrK+2Cq1EH
 Bdl0c6qr2f+8VcY449yPwjsM7n35wQTZWr1OtNZxVTwT2R81S2GuUmLgg82OZYwQ
 dcdJaFyDg/6tUrJZ6HzABHxtjZbaaH99x3JbmlI0AwSSHeNFIe/eBhmebZcBUq3m
 b6bRcPiJwflubakvVvPhhQKRjt6ZoMFet+b+ZqdsOBuQ7DuANT8yq77K6oFcjq7U
 OkP/cFVJpxf/KhBUvRff3UktF2lWMQifKf6YZ6RK6PS0oHtWEe9EcN26NXCBrjCu
 m3vnUXnvrzpYUP+SLE8ze0ZioQy3tt65DwkpENLjNCzsK9yWw7nvQusqH9LJTHUG
 FVrZ2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rykp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:38:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93a082c014aso758351585a.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791369516; x=1791974316; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S/jMN84BbNEg9gZKA9tCtKcPgGCUe69FH2FfKgWcd/Y=;
 b=WLHLD8nvPc7zZhYGnRN1CtmCRVPruqyskyQkIoybbCy8P8nguEe5b4DbW3hgmuUjG3
 pNSXY5u2o1jVMhAN/UH1cHZSmBC3bEonAICMRnqaJtMOvt7p0393RXFE0Z7t31VbipBP
 2aZ7cpcPtxukrbVJCZSO6uDER+8+2ZBwlo4uM2SOHFbyjm4qA88Xe3ihweztLc/NLBo3
 u0Paz9ruU+8P5XTy5D+i0sk+AnKWinEt7UL13XQnQ3XZGuM8BilGSN9RuVfq6SJBbuLt
 rLOKvmNAkjDmg3HjNRCWQVMHkUkM8iMq+M4OCzR/3lF/9f/cDaJXxttVLa8EYl65QmXW
 lTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791369516; x=1791974316;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S/jMN84BbNEg9gZKA9tCtKcPgGCUe69FH2FfKgWcd/Y=;
 b=D9woJqhC6hyPnOSmvU+L67mV/ZnoBIJkcXA9TPl+rLYZJ4EleSGYRS3zC0IeXL8Xll
 XxdaMtyjOasor1jaRqV7JCsQDmKARWlnnS8Rbzocz5EQQcGllC1Q8dn9M4M8gY4fsHdY
 FHjb1y0prXNl9AEaSIz3GNgyngjk9dBBsBfbn1/z9zX2gETofAlK1/TPvSGfnwt8wrru
 sanqW0KeQMSkw7fLR2H+B7hPMkk3wtgsjm/HDHZHxz2UD9AXXkqZvDXTx5Kc06Rhayxb
 X628gMDIP81/hjWFViESNxfp9VetLl5RCHRC/K8fjk7eUgT30TqZi1dzcDK5S961smes
 YTIQ==
X-Gm-Message-State: AFuF++ncVOTwBwAPgdO9GYkcU2Dad83VxSni9aARCCgOkUyVxk3TU78n
 mtu2A9J5hO+Ic1zbJ4gT9qXp47EE5T2SZM2O6UQL4ABSn4oyj0kZDhaD9tYd85vcw9jOIyGJSvf
 BdZFWq1MBHckK0DLPeK3ji2GAgvBMVGXI+xJ+bEcKn4zPlWfoGka7EYA6gQ==
X-Gm-Gg: AYBFou0WyWiDO3e+PkNSXPUZd6fw2lE5BXfesPxMplocdRKMoZcgPx0xPS9Fv7CVUSH
 XHGC3PyREXAboRHXvPO/zxzM1+l0b/RgCJygxshrV6F2PYp3tdJIBC/+8DX8dwPutjz8jyN0pz1
 S9PIo8l1KOD+BxCK5u7dyxEU4X35yXFcG+UKzFNsGntwvz30sWKpCFHmESg2SgNwxrAKKT9C/oA
 oGRmqCPwgrS+mJ/fM0ujfZAZLDB/VvCVhjitPDQbL/N9Kpp4Wzhj6PXM+Xl6qBoXifBvUjYVf5C
 00tgKhNJZQmfxAhI/MiasYVGbRi9LPi8ahpyrpj/OjJNQUbnKRVQhM3yy1z6l7QLFn/5p0XCZAj
 evlnT541zuxjXr/DOktB7i8fDgFIqzBojBg==
X-Received: by 2002:a05:620a:711c:b0:93e:5de7:fd45 with SMTP id
 af79cd13be357-93e8605d700mr1061876585a.18.1791369515496; 
 Wed, 07 Oct 2026 03:38:35 -0700 (PDT)
X-Received: by 2002:a05:620a:711c:b0:93e:5de7:fd45 with SMTP id
 af79cd13be357-93e8605d700mr1061874285a.18.1791369515077; 
 Wed, 07 Oct 2026 03:38:35 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d3d3eesm5371469f8f.53.2026.10.07.03.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:38:24 -0700 (PDT)
Message-ID: <694bf39e-dd42-4051-a41e-618506ca8b75@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/18] target/riscv: Compile riscv-qmp-cmds.c once
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-13-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-13-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX41m80SIMrb9D
 fHZa8U0xsMms8gV7EoQsbE1aFjk3BTPYYzd0Xe12s422mRqxJYt0Ba8CBpV8dwdeF9n63yhF1as
 qFyK4Gf4hGK9BFu6ssndVLRTKEz0mb0=
X-Proofpoint-ORIG-GUID: 7XuYWqjYJg2KG2YuUT3mWqUfMdliuJ1c
X-Proofpoint-GUID: 7XuYWqjYJg2KG2YuUT3mWqUfMdliuJ1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX+l3o816P6FhW
 LVebHUxj+gPsGUfl3pUVDQ3zQRIFsfIwnwDCm8fsNxJcDcVJisBxTM1kXXabho+3Xxg6V3uf3qM
 gC7yY+BSgI54h95DzheVV0rP+K8nm74WxrbT/6Nx5G23753VsNaTL9xIebvR1BQ2P5RYwn4Mrxl
 yCwZug2K60NoLWeDKv8zJ50VOD9zIukySFtw5+AJSyGCSEmuLmJiLmjHq1h1ZpdfYDMmFh8yfcv
 SGNOlCe7RP3vLDG/oleWNZonyI6/l79KgYJysigizmS6xiQwyJdrTYWNdc7oYaNJ/S72ENIjRGX
 Wejo2fMyUD9v4G9qTM+79dYGckdhHELpalvE71ZdypXrA8dEu+6/c/eDARh2VBILaU0ZDJw6uN3
 Vkx4T7kVJFNoTLlKAxcgq0Pc14JzoZD4F/lsFnTKThd86OcLbgYGO8tIKE3NQTpWSixrpz4A3II
 pUQWHZtAfJl7nbs3Szg==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac6212c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nFgamq1sSFmvarFgJzkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070042
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 7/10/26 10:43, Anton Johansson via qemu development wrote:
> File is already agnostic to target specifics at this point.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

