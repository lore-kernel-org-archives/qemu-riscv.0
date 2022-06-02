Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwn7N-0001D2-NX
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jun 2022 11:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1nwn7L-00018h-6t
 for qemu-riscv@nongnu.org; Thu, 02 Jun 2022 11:52:11 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:41444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1nwn7J-0006YD-Cy
 for qemu-riscv@nongnu.org; Thu, 02 Jun 2022 11:52:10 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-30ce6492a60so55714627b3.8
 for <qemu-riscv@nongnu.org>; Thu, 02 Jun 2022 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CKZ3l++ApnQ4sX/NJ5ek1OsaYLfMlrpE2AkkkEs6dcI=;
 b=VWHts6AOFmBHp+49giMdGNDMtmOGInvLa3IbMA4XFb57qycAuunyfhH7uXTC1x26i3
 N0A89BbmPEY2oWNr1qRKs8kuiEB7ZzS/952sOa5oyU9d4ouujYy69ibnvw8NblG60TNX
 i5wg9/qh6/X9sUSX11t2nyCArXwvqHdfo/u6U8cLDEu+vUqK0QGkDaIsl++3aMCPkzHW
 zR9QBO+S+lBrxaJVVdW2v5Y/36CCyLhnga3a2rOX9679a0rra4ZbCDgvIG1FQ08HL1xf
 xylgYKgWq3/79OQBtEihAtgyq/NZdMhVUFtODj6wNh7/4yLh+OKo39UTVddRSRzLPO4Q
 0b+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CKZ3l++ApnQ4sX/NJ5ek1OsaYLfMlrpE2AkkkEs6dcI=;
 b=tTfKMnRMAc0eUD+e/RXCvSu6IjslM0S592Tuti7fVMi331+GhSZo9Aawkld/aOtbTd
 V3l8KLKZyVoeZUh0UUu10u0IZ5TUubdMLiBKCU7PUrpRhiP/wBtLk2fsInob2T+zVjWk
 HnxUVD+UBHfFNj7D3yU1BHVvutdNti1NjVhniT+kw4i5RnMlxfcVKVcpRox7Pg8QZOZN
 C2GLxQlexE6ih6rZw3/k+V6R3HJ3ZfqFPIwtqlsJuAfDLV+D4RMTiU7Pwa48sse33JgX
 SGJCelIsEd1fzU8EemTMSpXCEBHsQBjLbMf51llKTsZs20r/wCDsiOXcZ/LJvDv7yZyd
 0A9g==
X-Gm-Message-State: AOAM5330z2xK6Es9g6HmxDooWOa2QlT+4y6rOabAdU3fbBTlA+88BeAI
 w7dT0M1WGi7N6+Dgp9by9CkJilpmJO86UnpGw5I/ww==
X-Google-Smtp-Source: ABdhPJxnWbzXXp4qUEJ3OEq8f1Dr1sDJpteUYO2KW3eYhAAF71FoNkTfvXYaDSRlhb42oAS88bLBJXRriXpOjIDMkTc=
X-Received: by 2002:a81:7256:0:b0:30c:4f4f:5682 with SMTP id
 n83-20020a817256000000b0030c4f4f5682mr6334574ywc.71.1654185125229; Thu, 02
 Jun 2022 08:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
 <1b930ae7-7e7d-b8f5-5202-2242abe994de@linaro.org>
In-Reply-To: <1b930ae7-7e7d-b8f5-5202-2242abe994de@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 2 Jun 2022 17:51:53 +0200
Message-ID: <CAEg0e7hAEzmsFNj5WjnsKYV5V7Opw2crcf=TyRN48Gh_j5kNgw@mail.gmail.com>
Subject: Re: [RFC PATCH v2] RISC-V: Add Zawrs ISA extension support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Christoph Muellner <cmuellner@gcc.gnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Aaron Durbin <adurbin@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Jun 2022 15:52:11 -0000

On Thu, Jun 2, 2022 at 5:07 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/2/22 06:40, Christoph Muellner wrote:
> > diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> > new file mode 100644
> > index 0000000000..38b71d0085
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
>
> Typo in the filename -- s/rvz/rz/.

This was actually intended as other files are named using the same pattern
(ext={a,b,d,f,h,i,k,m,v,zfh} -> trans_rv${ext}.c.inc).
I had the impression that Zawrs would fit into the pattern as well.
But if you prefer trans_rzawrs.c.inc I can change accordingly.

>
> > +#define REQUIRE_ZAWRS(ctx) do {         \
> > +    if (!ctx->cfg_ptr->ext_zawrs) {     \
> > +        return false;                   \
> > +    }                                   \
> > +} while (0)
> > +
> > +static bool trans_wrs(DisasContext *ctx, arg_sfence_vm *a)
> > +{
> > +    REQUIRE_ZAWRS(ctx);
>
> No point in the macro for what will only ever be a single user.

Ok, will change.

Thanks!

>
> Otherwise, the implementation looks correct.
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~

