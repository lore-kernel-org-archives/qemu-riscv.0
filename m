Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC66C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 20:05:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdCnJ-00008b-Fb; Fri, 26 Jun 2026 16:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wdCn7-0008Sf-1O
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 16:04:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wdCn4-0001EF-HD
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 16:04:44 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65QJahHl2324890
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 20:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y38j6Xdah/A3WTELcJ8HGxsz1c+xI48ymFQrxLd+uok=; b=eaqYvklMWGfUrIkB
 vcWG8UzAjMjU3i5pjFXMxpmEiWo6lq8KaT2MHKhGnALorUAgpoMCKGAy2Wk9FyYw
 tvFNn4J2s6kRkB9XNFDyNALK2MvQy4NmGzVOhu9wQpC7m2aDGlpWryMuSsaaM2U5
 zeDTFPFsk99JP1U8+N88XQBUvLcJGlEvYHbjKRsvSK4+Jdbg9bc9sKw8eQh87ehF
 gCZWExaMe9ZG9/MxL3A+rGcaDTEOlz8ESHfpfLoHRGgxYSih6sLbX5sKTlCyPfUo
 D2q/wWo8z3+fOq1sLGjxrWx+YaiD0keN9Q+Pk958gzVhiH4XbRhkuUwD14R+RKkB
 groebg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1yqv02kf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 20:04:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a08feb103so23385981cf.2
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782504280; x=1783109080; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y38j6Xdah/A3WTELcJ8HGxsz1c+xI48ymFQrxLd+uok=;
 b=H+JfuWapTSmWhR+C/aw7W2BlLPMrc+pzKZr9ajYHWyEYT+hVWxhDuhO2I7sLRjwQFi
 dkuxTKkBUULwNy+XRu4MJqeyLpTgiuKfn0EH2p5xajVepuda00dCyYWTMxcQ6jDU/D2p
 QUgJhkWJ69wiQl8rkJ5tGGgDfD9fB7G/X0nM0HktuIWaFHT4Tns/R6/xt1+4CmDeegtM
 mLY+Q99XAOz18ywhSpu+z/GRlaWwbQltlgSdAcJ6xDsZOfCEYyK0eWrLF21+CO6ULdx7
 1wcw7XTT4l0T4KoQOtIiiu9D+AXrIi3DkyuQVYOtk2Vj9r9CkMmvTIY9Vry4tq4d3pCm
 bBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782504280; x=1783109080;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y38j6Xdah/A3WTELcJ8HGxsz1c+xI48ymFQrxLd+uok=;
 b=NU91KVmRA2vZs7eQS0k8N2zUQaoaZapu4gdsm9cixb2yCrPiQ7ckBC9uUGL1CFUCyi
 IdKPAzBNYxXiG7SvkwL/SJSNVNaQ+4isoR4EoO1nI46+oGTKQDazPA35N70M0ph3uO+5
 e1i5gvHsFFTzHmmqH/jWCvWmzzSwbhvTDWW7Kt5EhPbAFw8827qtvlu4W6SJfeK5MKrT
 7XqKkuk+Z7dubQ9izs56DEDSHYpg5Ya8UQQPhLsDAmGM1B5eo8+swJiN4cdRa6c1A6bH
 mV+TpaHaOmkv0WmUgIVxgbUes6uxlwngjoB0V1Tuv98SamSp4ZIBTEHt2T+c9cH8MHtw
 06LA==
X-Forwarded-Encrypted: i=1;
 AFNElJ94yFW1nsPeytnwf726k/BsT+RCg9VtaWqpqiDySrpAt1iD3eSrorfLbgTzdi7+X5gVhx3NINKfHM5+@nongnu.org
X-Gm-Message-State: AOJu0YyG4IXdJtr5vTXG/yo13zmzH+g/YOEwrsa1Iw+u/f5BHl0BH2J0
 eFbUlB19V+XWQF22mEUk9Tj5ZvF9OdoSS7YqN6Yge+R48INhrC4Ln1IX8KGeetfNupDH1vkZWCv
 /uILyh9YMgfqA0Pn585dmiPUWbe8AOHHgrsFLfyn2uE115vmWNC38Yhq6mg==
X-Gm-Gg: AfdE7clP4uS7pIZPy6Gk4xsGYKv04mClHixjIKgSmfxbb7ycJjRLYTpcU0X/Zd2c6y/
 uAy3yMxRtDBEoHiCvQF9O2Woien6UUhtjjim2ZT3HtnPyXJod8/MtzRcuDqYrkCjTTDTIGLaCmP
 QqJIzaYNvrc+c8VCE3/5hxPBBrgh5b7N0RsReapAsHaxg1B4duJlbnFWxLD9qhCpGEOaKfzxzSa
 dms9+ngN8WAoUhD8wfAN4UIGUBAFN/E2iIiR0TYx06IzdmBZ0Se6I+Vhxc1jyKe6Rk9dyVmfTEW
 eHp7xtHSm9N7ZDQBbIVrClJXCr9p8Kq9cPJawTOMA3wEKwT+O8vTGMICeJ+4MDfb1Z6Cp9mc135
 HKpAZYeS8LNAZAwSJRiNUu1DFPx4A1vjexrqYGwUFHq90
X-Received: by 2002:a05:622a:1a8d:b0:517:5e32:af23 with SMTP id
 d75a77b69052e-51a727ad929mr119369201cf.23.1782504279420; 
 Fri, 26 Jun 2026 13:04:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8d:b0:517:5e32:af23 with SMTP id
 d75a77b69052e-51a727ad929mr119368681cf.23.1782504278874; 
 Fri, 26 Jun 2026 13:04:38 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51a514b5271sm106828621cf.5.2026.06.26.13.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 13:04:38 -0700 (PDT)
Message-ID: <e3494fab-e080-456d-aa9f-db65ca947b89@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:04:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] disas/riscv: Fix th.srri decoding
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
References: <20260626-b4-disas-xthead-fix-riscv-next-v1-0-74228a3c1b21@linux.alibaba.com>
 <20260626-b4-disas-xthead-fix-riscv-next-v1-1-74228a3c1b21@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260626-b4-disas-xthead-fix-riscv-next-v1-1-74228a3c1b21@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aoiCzyZV c=1 sm=1 tr=0 ts=6a3edb58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=QfbnSVPwDX3jWXLam8QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: zd53ZR0KhZVYncyZerBefhUmpxDQRXX5
X-Proofpoint-ORIG-GUID: zd53ZR0KhZVYncyZerBefhUmpxDQRXX5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE2NiBTYWx0ZWRfX4kXss/r4iA0s
 K32YsynQq0s9RKvK4FZvN8/18g8cxIeOZOyJoEyXCDbZT7NQTbHJjFS+59PrgHZF0x/BRtdVwJ8
 uPkHan8DmGvsEq1S5fX3XUf8Znea544=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE2NiBTYWx0ZWRfXz9fH5MzJqcAS
 B2wwpleYHYAorfn5K0FAgLGqr4SyWgFXz37zM6OfnCmxfJx4DHWE3MYcpLxADtujBLwU+m3IFEY
 KaGLyTYle7hKjwCG5WFc8JCbs8o1lKeLeDR45/VYTEA313R9dBnCMOo/WN4DJyYbZQH6Gg/Tt6E
 35RPfZK6sjVDvP8tWzMMhDdDljerY4zKdTxZ3L73wWIfbvVK3n83gyaTMkP/kpAxIQzhhj+GJMC
 7lALNzvAjp0cnGj8JBLxPLMORCxenU8kaKWlckcmba0mou75cYtfkU0Hh62wHj6zNS6vmvFB6vI
 ZI6xLCcQ/FZ/5Fvv1cTjIjtUlbXzSgBUUAp4UZuRdez4EgQDImO2GvI2iJWanr7GD9+a9zVgXvf
 z/PD8lcCHdOLSzZ3/VEcXe+F1LHIm2cVU0PKv0+YZCd87OZ0DHmBgRWKQqgYSYgRRFwlHyDIZT+
 IT0WSS67hpIsH7ovC+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260166
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 6/26/2026 12:13 AM, TANG Tiancheng wrote:
> target/riscv/xthead.decode defines th.srri as funct6=000100 in
> bits 31:26, with the 6-bit immediate in bits 25:20.
> 
> decode_xtheadbb() switches on bits 31:25, i.e. funct6 plus imm[5].
> Therefore valid th.srri encodings are 0001000 and 0001001. The
> current 0000100 and 0000101 cases use the wrong funct6 value and
> decode valid th.srri instructions as illegal.
> 
> Fix the cases to match funct6=000100 with both imm[5] values.
> 
> Fixes: 318df7238b9f ("disas/riscv: Add support for XThead* instructions")
> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv-xthead.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/disas/riscv-xthead.c b/disas/riscv-xthead.c
> index fcca326d1c398a6745984b9f5d90fc5f7d54dfd9..2f2ddb8dd9a13e17a28539b4179cd10fa93c5941 100644
> --- a/disas/riscv-xthead.c
> +++ b/disas/riscv-xthead.c
> @@ -315,8 +315,10 @@ void decode_xtheadbb(rv_decode *dec, rv_isa isa)
>                           op = rv_op_th_revw;
>                       }
>                       break;
> -                case 0b0000100:
> -                case 0b0000101: op = rv_op_th_srri; break;
> +                case 0b0001000:
> +                case 0b0001001:
> +                    op = rv_op_th_srri;
> +                    break;
>                   }
>                   break;
>               case 2: op = rv_op_th_ext; break;
> 


