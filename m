Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76E5C53219
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 08:20:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woGZX-0006fm-Cv; Mon, 27 Jul 2026 04:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1woGZV-0006ei-V2
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 04:20:25 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1woGZU-0003dW-Fj
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 04:20:25 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66807ba2f0fso3012379d50.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2026 01:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140423; cv=none;
 d=google.com; s=arc-20260327;
 b=e3bCTbMRD5PPsDhlX1VTvlHmUsWNV08Jy7vn3oXpB4jKdhmN/X0c0nIBmXE77PGOxS
 BzkrFZICRK7hLPqVRp3BtTvo+R41LDj4vJ8SlrAk3F4FBMLGcLpuouc2QMDCeiChL0nT
 OHd6cKRMsaeQ6f633CvHezFLL8v7mgA7jNTS/lHPb1+bH5ndCbpL1oddfHSbd6iC5ebC
 OvgiXSaoUA84QszTeUrO7VqkBbglXr8Wlu4blJXQ+mw8ejh751inPDbBi0TRnyNU+xkh
 lK/apnyvFHncdlhRjW/j1TB/uFzTvUUmoi6vLw2RpbcuPdInMlYOfabLQyxzN9gBupnM
 Ifew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jY5R4YnftG+67F752+w1fCDnLdBQjLukzln0QJWYakA=;
 fh=+3VQw2jiaykP8ZqsYUXXsz1IHCpmNyjNzt6j6Mo8hRg=;
 b=BmvVSqXhkMBGsFk4lNnWGVXo9NKJBHpNAo49oMkSVpGI3BdkgUx4d4Ipdd1YDWndGL
 ljV4o9zK8bEfCmPDHkfwbTI0uBPZsKhfAEP0m804RZy8x2WDq4sM6vJ+5buUBasSwWHM
 q1X9ObkV9AOqXJXm46t8zcAxOlUDUKusnzfv7A9p/IM2M3M1DZRWeAHrCfdLoJG/uP23
 O8AITnPkFaukMUsClbcyHxPCXLbE63kgmv89lesVRFqXFYbFElNowQHMGjRe02dbr5ag
 3UZfj4q4A2MSTDoMLTtuxHWRmmaHIEf/PjDj3EwZOP3J8QsmPOwDeNnNJv2TsOUc5hFp
 SB9w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785140423; x=1785745223; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jY5R4YnftG+67F752+w1fCDnLdBQjLukzln0QJWYakA=;
 b=QirrN9HsWGijEltmMy6UcPRS55Ynk0Gfve2atWffmuSjyPRQzzXalUEVeLP9DGEhng
 2IDM5yLfCpSrXlpuQiXy0N9D2rstpSqqKatid6k05zwPlzVhAc9ey5kdSb/a3aDfsVF+
 imAjJyMvskiRz/3i+hAaXrPwtS0s8YneXO720VkFurOiwc4KzdfniULXgxdAC4xzhHzz
 zHq2SmSRWM1RGuw5Do1Nl7VwA6duggPPu0h2AdJtpXIjROcT87O67Lae2TJW/Xs3SupZ
 7Lr84DGjPbQfNSC+ibwB5y0dRDN9eycbtzrL9OzQihmprfV3nFmfj5AFZM8rWVQAC6kS
 S7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785140423; x=1785745223;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jY5R4YnftG+67F752+w1fCDnLdBQjLukzln0QJWYakA=;
 b=YJSmUEwEHXL3ACvq6h1qvGTnD/q3a0uDTHCY0X28Kls7LhV9TKbF9GhluySBK8rAkQ
 t5zSKXRadaobGfUxOf/q6DYnvi/KOisDj94zZmHO1ugBTlagxqd2g3IWV1G07YOfGCdW
 4QZR9TF6ZaSLeFdPw4TfzXjPMITiHQV7nEi1jqTZJ9bP2mFSfYdYItWw42G9N3KI5+T8
 1QDangGWQWgV6IifxrD5+/fPRXUUjSgDYgFaF0F8xvdVCuZoqmkcXaEXIW6K4B9ergOh
 nCV6H7J5dCX0dIwEK58yCyQPfzb44UGiSzIBWmYAqKJQKaNmwIJfh02dO07qySz1V5AO
 /zjQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RouiIsIC2GqFKhDrZ6vsRgZkTXKtjrnymFPud1VucMMuXymqNaaaFtOoydnYBQ9N9ijj4xsVQZIsvlg@nongnu.org
X-Gm-Message-State: AOJu0YyxdQxsRb2l8WfIJI6gth3NVBSSovoeUQ2cUy+dM8aAhnSDxzUm
 xqTNljoBTpBemYJ5TiCDDjphU/s3yjkEE1L8tFJWXzx5g3yS8icZulRsg9s5TvomYEoQkyUox5h
 TrmXl8xjtuM0yKqbd1jqwYh2TR5Y2kxg=
X-Gm-Gg: AR+sD11XKP+1W1vTy/4zPc/Cp6IgdeGHCU1x5GUdcHpTkwQ3VCIEkAVWkZCxget3535
 cbkcvfBRW0aBN9MmjHOzjyiRcsWiYmU7s8g842jM7QhoOWHHFiflJTEReUipedrV4q/Dp8vRv2v
 BV1ALPMOhvPA/iV8PBRuCDMG9w7tFPqzQ8QLbvZaw6cQ0d4rI9vhLdpLAYLD2l8NBBxI8mt4Lao
 qeB8S/GchiZWRuQOY1BqaHIgzn0AySsLwAD+HhNIIrqEUD/QO4GLBDsqtcNuozCEnjD450m8jUZ
 dZmBz16YNuPtlTykauvL
X-Received: by 2002:a05:690e:43dc:b0:664:d186:4737 with SMTP id
 956f58d0204a3-668c79ea27cmr1581439d50.27.1785140423193; Mon, 27 Jul 2026
 01:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785064312.git.flamboyant.h.01@gmail.com>
 <12e325190a15045cff5c429b154217814cd9e618.1785064313.git.flamboyant.h.01@gmail.com>
 <CAEUhbmUEF7fLEP9+HbE6mKE5OKsVm0rds+1S==BtRLArLZMbxA@mail.gmail.com>
In-Reply-To: <CAEUhbmUEF7fLEP9+HbE6mKE5OKsVm0rds+1S==BtRLArLZMbxA@mail.gmail.com>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Mon, 27 Jul 2026 16:20:13 +0800
X-Gm-Features: AUfX_my5W-JnReOjWkXYfWOzexfEZY9mN_IT7v3NsbVMsx3V2W48XUR2rDhTa1A
Message-ID: <CAAW0U4YezAk=RRM2ERqen=znt=kY4+nLrjJOEE2r=pwzc0Q+vA@mail.gmail.com>
Subject: Re: [PATCH 01/11] hw/ssi: Add K230 DesignWare SSI register model
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, "open list:K230 Machines" <qemu-riscv@nongnu.org>, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Kangjie Huang <flamboyant.h.01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Bin,
Bin Meng <bmeng.cn@gmail.com> =E4=BA=8E2026=E5=B9=B47=E6=9C=8827=E6=97=A5=
=E5=91=A8=E4=B8=80 12:45=E5=86=99=E9=81=93=EF=BC=9A
>
> Please split the model into 2 models:
>
> - One generic model for Synopsys DesignWare SSI controller
> - One K230 specific wrapper model on top of the Synopsys DesignWare
> SSI controller [optional, if the generic model is enough to make the
> k230 software happy]
>
> This way we can reuse the Synopsys DesignWare SSI controller model by
> other machines in the future.

Thanks for the review and the suggestion!
I will look into the common parts between the generic DesignWare SSI
and the K230 implementation, and complete the split in v2.

Regards,
Kangjie

