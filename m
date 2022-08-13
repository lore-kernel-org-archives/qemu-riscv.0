Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMjbe-0005YX-IY
	for mharc-qemu-riscv@gnu.org; Sat, 13 Aug 2022 01:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMjbd-0005YD-01
 for qemu-riscv@nongnu.org; Sat, 13 Aug 2022 01:22:41 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMjbb-0002Tt-KH
 for qemu-riscv@nongnu.org; Sat, 13 Aug 2022 01:22:40 -0400
Received: by mail-pl1-x62a.google.com with SMTP id z19so2370715plb.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 22:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=E+BdtZ+KsicaIem3u8uKaHjgOL4BPduBvJWOjKPEiuA=;
 b=sFP9saguCsXrC4xOkhW/ZWHxijOQiBSzbOHPQD0M1z5RINXEn1Al/N2VSXb7mYQZcp
 QgkdcmI71jFGIWx+Wn/bFxX1e1cGzPIrl9KA+9KXzh6TTBP5Q/WXia6X8XS+ASZ58fyG
 mmstgmH4OL0CNmywn2pgjoQVFgBl/mgXHXFVIE8tNlNLrHjWwuvIcMfu5bVjNhq5U0oz
 81itxCuoFA7pWIivMSVTLikYXAu3ztq9E6xIQTT86pAQpYQ1ht7rw4yn3B6/ImdVzvxp
 wwNciqxsQn1n4A8sfGDkq/4to3wRv1gpDAP/EeWYiypSVrlk+ChZBZdQ2rKkG1KFe21I
 Y7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=E+BdtZ+KsicaIem3u8uKaHjgOL4BPduBvJWOjKPEiuA=;
 b=Xx4LgusSxC2sueAnSpsS5dXP6mUCZTjwV3tmDN/8JOU56ROaSjp4WStVPriwka2O5k
 OPLTE6rLfsGQSVFcgWm3Zh9fSd4+sYbace9LJiG0J7yDEiJFYCM6ZHDYh3H6WAFNcfd7
 tJTYOi5Cet2rKxodCigvsYYW4yPDndF08Y61Gux6eBUinAgcfKFT9Fy+7S9bL+8KC4pZ
 AXW1vi8tFfbGfM+A8I2q1AolXCM1TtCu3dlXrcSwMMfb9C+BKqLv73oO/T0TpmUeIeTg
 s8Lcgxb0pb+U1LdLiYHAZ2PIfwzGbl9ggO+PegM1gSNlROkMNUTlR+Xllgg3Gc5W8uzw
 CtSA==
X-Gm-Message-State: ACgBeo1SAkv5EUFnzUGn4aSRVWZ8OUNsHHBCsYbeMl6AVCglroro9KJx
 zSJqWRWMEyGGCBZNXk0X4qubUbY/Y5XU1O8Qvngs+g==
X-Google-Smtp-Source: AA6agR5MaBoR717K1dS/DPQ1wOgqKkurnOKJ3EGFE28OEyHK6+FcbW90TvisKRY8YubnSz/SyBEZPZ9wkC9RYY3NX20=
X-Received: by 2002:a17:90b:4ac7:b0:1f5:3441:d11a with SMTP id
 mh7-20020a17090b4ac700b001f53441d11amr7305137pjb.182.1660368156920; Fri, 12
 Aug 2022 22:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
 <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
 <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
 <CA+tJHD6gNrtcrZ9bkDet8NuiR8mcSQfeN-Rk3dtm3LmeakKnvQ@mail.gmail.com>
 <1f4b1b9b-51a0-8970-83ed-b4618a60cb1a@linaro.org>
In-Reply-To: <1f4b1b9b-51a0-8970-83ed-b4618a60cb1a@linaro.org>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Fri, 12 Aug 2022 22:22:26 -0700
Message-ID: <CA+tJHD61M3t66geq9R_M+robyoK0dqZ7ScebZjOzsiB2Muz6WQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=furquan@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 13 Aug 2022 05:22:41 -0000

On Fri, Aug 12, 2022 at 7:32 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/12/22 17:50, Furquan Shaikh wrote:
> >> Why do you need such fine-grained control?  What is the use-case?
> >
> > I ran into a problem when I was testing a project (with a microkernel
> > in M-mode and tasks in U-mode) that uses semihosting for debugging.
> > The semihosting worked fine for M-mode but not in U-mode.
>
> Sure.  This would be handled by Peter's proposed userspace-enable=on property.
>
> > As I started
> > digging into this, I realized that this is because qemu restricts
> > semihosting to only M and S modes. From reading the debug spec, I
> > understood that the DCSR presents options for ebreak behavior in each
> > mode including VS and VU.
>
> I strongly suspect that VS also already works, since that's just
>
>    env->priv == PRV_S && riscv_cpu_virt_enabled(env)
>
> VU would also be handled by userspace-enable=on.
>
> I do not see any use for 5 separate properties.

It felt more natural to mimic the knobs that are provided by the debug
spec to allow users to easily control the ebreak behavior for
semihosting in all possible modes. I agree that it is possible to just
allow semihosting to be turned on/off for U-mode using the above
proposed config. It would work for the use case I ran into, but if
finer control is required for other cases, it makes sense to provide
the ebreak options. Anyways, if others here feel that the
userspace-enable option is sufficient, we can go ahead with that.

>
>
> r~

