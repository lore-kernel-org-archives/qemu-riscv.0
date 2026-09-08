Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885BAC79FA0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 07:33:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3qKW-0001jN-3J; Tue, 08 Sep 2026 03:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3qKO-0001iz-Ii
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 03:33:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3qKM-0008QO-Dc
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 03:33:11 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6886LdPd1477246
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 07:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=FJ0xoQPf5oOoMa0v7icu0LvWrxjxWOB8CX8g7gFWM/M=; b=FM
 buTjMNLOvNbcPAc3AGaqIVm/Z08FDTbqVhNVRHcuZrsj8uAKMd3J8ygZ+QHiMnsq
 Q7oz48VsSmzrjuVLm14uGO2Zzmm0DWd1lI+z6YGpbHUDZjBWbLkikOiGDwrVJBJS
 tfIBCjq2zQtcusnOjqnH4fqrDdcom3xZL3j0XT1pGn4hXaZwe58xh8sBjqLfoHg/
 WBVedXIDkjVopiesA/o5HqZfgi/b2p2EF9HN1Hd+CDrE7o0x+QVNw0qktxEJ44l/
 HqCe4doio9EF+jtCiShBRK9YcCb3egZMnuR3a8Jw9E7bgIEkHznv951SKGXDLlwo
 6bvXiRVCOqfNlF+6NNkg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjgs58-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 07:33:08 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-7f582244e9eso73287717b3.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 00:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788852787; cv=none;
 d=google.com; s=arc-20260327;
 b=hfVqGTBCkYn84KrgdmLhliAT/uceF+U05dMlrpBMwLdHEoShxZGcNN7J1ojDN9kxHQ
 NbZYL0dPHNbIuPfjrLmMItnCv7gc8GWhJzAM/+5rDVBc8xfIbP3wZREwEyz4PUyl3ViV
 OlF/FRPWuXtNo2zzgKa8YZIA/64h5FPZmq9idyy5rCuEjN/lFwyWo7+wZ6pHFdS+K9E1
 JR/ep5MvBlYtydT4NasZdfJ/L1/voyzAMcVtAzXnIU1UMZrX6JzaRc8G7JNR7/8ptJ1h
 W61v3eZ8EgRNFEbrtXp5nPmXeSwIS+j3Ro6PSvNkcjM+6sWNxXpbKZUuIc8YQPjtbASU
 NQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=FJ0xoQPf5oOoMa0v7icu0LvWrxjxWOB8CX8g7gFWM/M=;
 fh=hKpH49Hf/yGQu0bPnF8LyfE/iJUxtZXUGgFb5vLE+Ak=;
 b=kavk4R1hETYhryoStEkagq8ZWW+oKA2u6agBFRnLIpKQZ53rJmGfaRQOfKcEdzGVzl
 Nkw9MY+7xNLWO1NhbWWSDKqKmma9kiXsVWzzio8kfGHY7FlrHNMPxDDwDL4u1RwzpY21
 mzIo87lE4rV9b7lnle92QwnHpLGRztNR3cYzJp8WnQOP8mp9Ej7niF1w6a5uLpVqJmTS
 HGd57CzQ96OB8qwwFfzfo7yYdgZAq8pqSj8Lq9pp9oD/OqhoPv2G+5LTMDXQdhI5xc59
 NXN2XDmcNRCl51F7xLxROUzLjhfjO0JlKXHW5e3zSNMjgAwX/mSbhNIiyeO9i0HzLves
 RaHQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788852787; x=1789457587; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=FJ0xoQPf5oOoMa0v7icu0LvWrxjxWOB8CX8g7gFWM/M=;
 b=kWVlzQB8IwxcphbSBgbTsfm3tYsxdqaokcpgF3m3PImXMz75Zq+MGztlTCRB0r/d00
 +dFvhAsTz3Oy/B0elcrmyDG7KDyV5dVt2r8RLIhxQzeZ5LCuRt7oXr9c3piCa3B9I7B+
 qJ2rHma1GgjfsnEIayhyAQ2yKadDfuFPSDLFgqr9y7sDUKIL+0ZeW7JamBNLVECheGDL
 vXzOIsYZ8YiGl0Lo+zW42W80W5Dchpd5+AY0Kbh/liao+5yMQm18YRUNhUTGfCK0ZxR7
 pgUAk/TrF2qnylfGCOcA4XU15Xn97W0luWFPGR3i22BZXNLhkFmUJAl/+LlJdqx8tnJ/
 /IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788852787; x=1789457587;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FJ0xoQPf5oOoMa0v7icu0LvWrxjxWOB8CX8g7gFWM/M=;
 b=ipZFSydlaR9RFbCFQjprwfjap6PERNhC18uuieiivtzPlKucyHoJ4XWWnK4jpZhG4q
 VakHONtqVFkYOwUlIlyaUGm7Kyts8aOAfLyaw3yocKzUs9MBuNbmUjL/M2KqHfderGB4
 V3wReAhkGBtn8o2fzhtqW4K1EXPA/rS0ahteenWYFVBot5jcKRjrEruQ6/Yib3ErwR+z
 omNYdyAw+BSGlYFQD5bSsyOm22TwnrHlUwvWAako1lOgGTzxann1qCi763WAbQcexYfn
 jXtKb5U8h7NkWtp+bu5RBPzhiJE9n6qoJLm02loDi3OKwvAGUfbxO+UO2flYoEKAINtq
 UxGw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzCiDKGWFaWnbfzuvMuRKAfXy3c2KxmOQ61NZE7JxMDcci5U0zgDdXkBEYTcvwWmSJXbJ0AByHZBsj2@nongnu.org
X-Gm-Message-State: AFuF++kChVUPBLznPfH+ng4vKi02olMd1KXhzVjccRwRP34rgB0vkndO
 osl5iwoFm8QmITZM0xagoFnVeyPunaxARQm+kSDzkTujj9XzJzQvZ6GEy7BHJ0yTtUbENNRFcsI
 f4ue3yYYELa3Z1bjDls2Mgylay0I/y8AHsCIWnRBw11soS6tUh45DqNRxcsWWTALMNB6uV9S89t
 yKpzK1akq7SGjeWNyA5DzXbDvFG4+D96eh
X-Gm-Gg: AYBFou1l/h3InmIfxRTa+v7vKWbUx4BaP9xdVajqJoMkf/XhlT2qUJr26PxOZEkrWkp
 GZS8MGXqzV8wZh0IBhqXG+jqhtFpbLwI4h4TYf91TEEzfvHFli80faP8B7NfdmVXGDnig2cJZHR
 b5sM4SsMEje6FGtZjlhNbDVhQzuotHGt/xt6ytMT/L5PwYHqTyavEflEHYhTs=
X-Received: by 2002:a05:690e:138a:b0:66f:c1db:6dd5 with SMTP id
 956f58d0204a3-66fc1db828dmr6138070d50.54.1788852787621; 
 Tue, 08 Sep 2026 00:33:07 -0700 (PDT)
X-Received: by 2002:a05:690e:138a:b0:66f:c1db:6dd5 with SMTP id
 956f58d0204a3-66fc1db828dmr6138055d50.54.1788852787195; Tue, 08 Sep 2026
 00:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
 <20260904195610.964829-6-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260904195610.964829-6-daniel.barboza@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:02:56 +0530
X-Gm-Features: AcwNN1Xhe2oRpDoHgb5cjGmiTLVFM9I_cEjTNcdePQLl2Lo_GLrM2tJDCx5WZzY
Message-ID: <CAB19ukFK_q7JnzON6AcLo6VupgnQnYxTKUv=Mw_1kZqYOLj8+A@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] docs: add riscv-server-ref.rst
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, andrew.jones@oss.qualcomm.com,
 leif.lindholm@oss.qualcomm.com,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX/+S1HS6Q2S9S
 83mS2EsCUIS/23IXBdA6wAKMNoP1MbOO1CR7LDYXg5e46JgINz+l3LOPzh3n1v2PXNbr28VOj+b
 DFBHr7er33oZxx4nev9jh0mvdyif970=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX43UY0bHP4dP/
 t23HuKBTHySSR5jffRaEppiwzHs5ajQ5+ni6V19mhpA/OGOGs8uZ72rfPY84UjA3HfqQZSobpy+
 Xb8GgltDhQ6B1FwnQOFfGVXiOEP3XCShNng3QlgwtN6k+YgFt0Ngx0H5lbmaG9NAFuPyeSyxcsz
 lpmwotlDn2T3tsNEc8wFy1q/pwuywJSdkGaEpxeq1u/A35jlEGYgytzH/KabnYtzJkZ1iw6r1Au
 z/KPDkEmG4i9hM0turR2JTp1UyIbf6PVq/d3OzVYZixvVYkP9mj95gzqj5ugsdDtBJCgAJHCKcw
 SLPxVnaLlIiR9MIZB8hlCNhlUE38EssYFYLOEPWtp+UxamCHpLj2lQs/pgANZuxzWS5Jug3wjfi
 RqxJ50i3bSfaW9H0hZ/24gBa1CbhY+ObaZBoCZDdE77K5GARBzH8w+uXYserTi/OpdXjg2UK3ys
 ErUUVOWn4vVpOwQhdTg==
X-Proofpoint-ORIG-GUID: TQSegYW7bykJiMTIrII1ZPB35fCYG3D0
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fba34 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=FRSEYCzRAAAA:8
 a=r-YDLeC8pWfmBPvFspwA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=xVlTc564ipvMDusKsbsT:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: TQSegYW7bykJiMTIrII1ZPB35fCYG3D0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080076
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
Reply-To: sunilvl@oss.qualcomm.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Sep 5, 2026 at 1:27=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Add documentation for the new riscv-server-ref board.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Chao Liu <chao.liu@processmission.com>
> ---
>  docs/system/riscv/riscv-server-ref.rst | 62 ++++++++++++++++++++++++++
>  docs/system/target-riscv.rst           |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 docs/system/riscv/riscv-server-ref.rst
>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

