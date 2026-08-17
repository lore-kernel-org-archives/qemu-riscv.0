Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BC7C5B572
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 08:56:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvt8F-00013l-8y; Mon, 17 Aug 2026 04:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <0860734llx@gmail.com>)
 id 1wvt88-00013E-Iy
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 04:55:41 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <0860734llx@gmail.com>)
 id 1wvt86-0000Pm-VO
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 04:55:40 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2caea3f742bso53979915ad.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 01:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786956937; cv=none;
 d=google.com; s=arc-20260327;
 b=J/6yjF8DQUOIkRzsxGtz3LrHemrivX4M+1KDRYINY+Pbj4ISQktLkXdcbjIq5vkkOz
 NyTMFIgyGbfGhwy9h1gwU1Ht7Ipg1cPqziysMzx34q3h19ZdUS5JSMOFUJ+5tCWhVM+M
 97yE6ubBgJo4qdj79Gj28Tek8XzP4R3EisNX7PCo+TrR9pmhr44MgRGm3RqoF/X72lKZ
 nqh0YEbspLADBflb8Q1KoSLX+WJG98i6Cj42xjstcyiufuJ95GBOVWulMovHy+cTpimX
 eByIpetRuN9mAIAcxNJsLv9kj6843/MLUpG0DC7gCRek1nTTH+jtdJdF9re3rwtl37PH
 vjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HsjnM4/zRylQ8X2Az69flzz59FcYSXgM2qgQK6wlzlA=;
 fh=E+iSYMknQZ6E+SNJByU8rKVKtR5LrXCdjFGeopLNZJM=;
 b=m0gRiBJUW+F2umbGt3ENQGdeSHFEMABgG8CVp5d1aFYO4CUOcPA7O+j5IA3AKzfgML
 ug2S5YUUgxMPq9hGbGYC26pNh9qYUHBrkTwq5WdYDN3fDEemH21+FYC3faYaOamdT3E4
 qgq8xMhGH7j5YzWcX4u4bXEJGcSR8XjwK6/w7rZwIlaSKgLihoNySVEHUqtUnIuRM+sX
 8MYQMfOBHFWirAvR9fnw8V7awUgz6PsQC7NjY+6VCHQzkrtDH7hQkoDwNLS8kfH9/xRm
 ETrFgYgZOqogadI2physRDtNGH0rIWBktY3n8RLA5zlWT14YE9OPNG4wLJHZardfljJ1
 no5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786956937; x=1787561737; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HsjnM4/zRylQ8X2Az69flzz59FcYSXgM2qgQK6wlzlA=;
 b=oTzZ3OawT3SW+KBeN46yGaPuXakZal/6htXw5S4GRDPNNX+gaZ6MDjArXW90YmZE2h
 CoD4gzkRE93Az2p/C7Rr9kKcopkZuhx7yT7V2wUHCPYiIOD+t6uvy0rwvbf/EjoorF7x
 SbS2PFRysv/iEyywnLAkJ5to6yeJRT7EP2D8rz1hc5pxhfRYmUCPEFofGC5lWB6DL697
 B+dLP+cSisdQHFarddWz1hOPAJZs+fGxpHwU3+jFmNus42BzHfPIRIe9y9Vo1zXnunOs
 hOmwPWETaaN0tDh9nkc4Fkj0qbS3v/IqO8Tw6BdxG6uy6GjTzlDeSRqco4GUhsSTwlmR
 Z8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786956937; x=1787561737;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HsjnM4/zRylQ8X2Az69flzz59FcYSXgM2qgQK6wlzlA=;
 b=arEvnnjAGHmTLWaNW02KZggKAn+YDg9DYcascJE3NPnKb9JudofrXQfW5GXjSvOIFO
 difgYvqeD3qg2QlaHLoVozm4+zQLPN9iucR7rQv31gael+ueqphSYE6zBNqkb+6BfMTz
 cvq95vH9t/ULEy7HuwN0RfPlZq2MswJOj1z2wh7cuUibUSOmPxF7ckcHTKcwoFUCrGRj
 qx6W6OoiIqPP1Pd0g4X3/mSwuIsUaEumLSVFUkvbYnUHrCzWAyJSBu+vVFcHXXVupgTs
 MPJu/wvWWLl4AtqMoSytybRKoYjjvTTZqcKkrA8pS2i8zvj7Q5/OVWImm79F+dNUS9aP
 rb8Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqn945lRX6ZZjJRsjxj6+lyi4TJKzkHenchwdRKC+VFWdqfL8LWY4eJ6Seooi9OJesZGqkcZPirmrRH@nongnu.org
X-Gm-Message-State: AOJu0YyR5Sx8ER/OFynpV5Sk26zcQrWruqGcj5UGcwTnNAobmnC9ajDu
 WSoK9IPpoLhod3GD1ZO++tatUfdPW9JXsAXNUzJSA9oUbrUopXM32YHqao5Ifyb1TWC1LFuxn6E
 S97zDd9/XaiGL1CVUVddzOv1qCdBlUdk=
X-Gm-Gg: AR+sD10pO9t9T1bH1kJYf/ZePIsg6utdA8LltwmPuQbs/MQZQ4GwF2rTls3BktYoHed
 RpiI0awzG5+OnYczWMcnU5m8gGJ/5KglvKsspckIASu7SnXa6rhagdBc1vVtTFZg4+TrXTaq3F4
 7rTnqTCPYkGMRehiQfg5/QDefhCKhC67ld8It0pvVzERZPu11O8+RPAyd2/g+SHcCDAQDatcJVo
 6cg7jyjVufHJYuoHT4bbzIoRHXRxEC0JZP8lXLoiur2sfQq8CL57GuzOYYvBfG9mz0HrNyekOhP
 e6Fj460Gt7wcfd4Z9ryvZ62DguWng8/OGNoX3rlbTEe5sg==
X-Received: by 2002:a05:6a20:728c:b0:3cc:2c74:a0 with SMTP id
 adf61e73a8af0-3cc71d78433mr23489068637.21.1786956936942; Mon, 17 Aug 2026
 01:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260809-feat-k230-cmu-v1-0-8792982c446c@gmail.com>
 <CAEUhbmVQid5yboTQzDTANT-zMEzLiJkom0qLfKRV-nP3nq5uaw@mail.gmail.com>
In-Reply-To: <CAEUhbmVQid5yboTQzDTANT-zMEzLiJkom0qLfKRV-nP3nq5uaw@mail.gmail.com>
From: Niel Law <0860734llx@gmail.com>
Date: Mon, 17 Aug 2026 16:55:24 +0800
X-Gm-Features: AcwNN1VB8FpM0cK7uiZZQ45tQzkPmMO4MdvY01k4e5VvpHRBjTJ2cXB04c7fsso
Message-ID: <CAPWGWA7eg75vptnzQTCVP5tN_DxTh4_01ZrCHa7eDMBdqrm5OQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Kendryte K230 CMU register model
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, chao.liu@processmission.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 pierrick.bouvier@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=0860734llx@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi,
Thanks for your reply.
The clock model is not a must-have for the Linux build from the K230
SDK. the vendor clock driver allows PLL unlock:
[    0.093353] thermal_sys: Registered thermal governor 'step_wise'^M^M
[    0.409760] [ERROR K230_CLK]:pll pll0 is unlock.^M^M
[    0.414011] [ERROR K230_CLK]:pll pll1 is unlock.^M^M
[    0.417540] [ERROR K230_CLK]:pll pll2 is unlock.^M^M
[    0.421088] [ERROR K230_CLK]:pll pll3 is unlock.^M^M
[    0.456215] k230-powerdomain 91103000.sysctl_power: powerdomain init ok^=
M^M

But Linux mainline will boot fail, it poll STAT.bit0 of PLL forever.
From drivers/clk/clk-k230.c:
#define K230_PLL_LOCK_TIMEOUT 0
static int k230_pll_prepare(struct clk_hw *hw)
{
        struct k230_pll *pll =3D hw_to_k230_pll(hw);
        u32 reg;

        /* wait for PLL lock until it reaches lock status */
        return readl_poll_timeout(K230_PLLX_LOCK_ADDR(pll->reg, pll->id), r=
eg,
                                  reg & K230_PLL_LOCK_STATUS_MASK,
                                  K230_PLL_LOCK_TIME_DELAY,
K230_PLL_LOCK_TIMEOUT);
}

Furthermore, SDHCI/USB PHY/SPI flash driver require valid clock
config, else causes fatal error.

Best regard,
Simon

On Fri, Aug 14, 2026 at 3:53=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> wrote=
:
>
> Hello,
>
> On Sun, Aug 9, 2026 at 7:47=E2=80=AFPM Simon Law <0860734llx@gmail.com> w=
rote:
> >
> > The Kendryte K230 machine currently lacks the Clock Management Unit (CM=
U)
> >   register interface required by the K230 SDK U-Boot and the Linux K230=
 clock
> >   driver. As a result, software probing the PLL and sysclk providers ca=
nnot
> >   observe the expected reset values or register update semantics.
> >
> >   This series adds a minimal, deterministic K230 CMU model.
> >
> >   The model covers:
> >
> >   - four PLL register blocks at 0x91102000..0x9110203f;
> >   - the defined sysclk registers in the 0x91100000 window;
> >   - the software-visible SPI2AXI_CLK_DIV register at sysclk offset 0x10=
8;
> >   - reset values and writable/reserved/read-only masks;
> >   - PLL control write-enable semantics;
> >   - write-one-to-trigger update behavior;
> >   - deterministic PLL lock and initialization status;
> >   - VMState for stable PLL and sysclk register state;
> >   - qtest coverage for reset, masks, write-enable, W1T, status, sysclk
> >     updates, unknown offsets, and system reset;
> >   - K230 machine wiring and user-facing documentation.
> >
> >   The model intentionally does not propagate clock frequencies to QEMU =
devices or
> >   change CPU execution speed. Peripheral reset, power control, and the
> >   guest-initiated K230 reboot backend remain outside the scope of this =
series.
> >   Those functions require separate reset/power models and a matching Op=
enSBI
> >   backend.
> >
> >   The implementation is based only on the existing K230 machine and doe=
s not
> >   depend on unmerged RMU, Timer, SPI, or SDHCI device series.
> >
> >   Testing:
> >   - QTEST_QEMU_BINARY=3D/workspace/qemu/build/qemu-system-riscv64
> >     /workspace/qemu/build/tests/qtest/k230-cmu-test
> >     (10/10 subtests passed)
> >   - QTEST_QEMU_BINARY=3D/workspace/qemu/build/qemu-system-riscv64
> >     /workspace/qemu/build/tests/qtest/k230-wdt-test
> >     (7/7 subtests passed)
> >   - K230 direct Linux boot and K230 U-Boot boot
> >   - Linux K230 clock probe and clk_summary validation
> >   - CMU source/destination migration smoke
> >
> > Signed-off-by: Simon Law <0860734llx@gmail.com>
>
> Is this clock modeling a must-have to make U-Boot or Linux boot on the
> QEMU k230 machine?
>
> Is an unimplemented region enough to make the software happy?
>
> Regards,
> Bin

