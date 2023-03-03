Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAmn-0002i6-HL
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 14:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAmm-0002hl-Jo
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:09:44 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAmk-0000Eu-Sp
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 14:09:44 -0500
Received: by mail-pg1-x52d.google.com with SMTP id bn17so2084029pgb.10
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 11:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0sQhjcqSH8pb/5Rz2U6mXpjIZSWWlhhczVIyOLu/xU8=;
 b=KJDdj0cwh/JLQ2rdLqiK0mL8Vvm9KK91rtRr5rf/vVNpD6FOzT7jS9MAmNo/XBliLN
 /TBtD7UkJ1CKg4iWDUxjdffPVyi8jX1FiARCbGDUeyfSgZFASEyMIr/oMTAF513hlynp
 E2m4mBDKyMIc3E1bzo5lQAdfHs/o0URyDU0wUFfuEa7Z73UC7Uo/byDnGS9bW6mIhXx6
 SbYwc+htXNk4njTtDn+X3xitG2SNrch7cN4yKJkF5iLK4zUMmNeaY1Pu7Pz7a1wbkVDb
 OkBMGQWmRM41n2gDDfrj7CRCa1+R04smm9btLEZdYsIxcP3QzNS5nEUWHjoGantOeQ68
 svNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870581;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0sQhjcqSH8pb/5Rz2U6mXpjIZSWWlhhczVIyOLu/xU8=;
 b=tDds9bh+fLUXxliALAb7RBx2CXXAuSnD9XVdXWLY0ufYvxF6/0ARc88oaH23o4lj5E
 pathFWF1+hkgOIkBpTrNygywebf8oFonaJBJ8pSCFu4EwadpuN31MFIWXCXaqQeOR17e
 K05Oy5qDbzdTAvFseN6vQfOGNdeoEdvWrOU6RSEbV89ZLNAztQ32bYb/PT9p48xqk3c5
 5i5ou/96rDxZTbOn+0RDACDX8fRzUv+gWL7v1abyoCajNJffjRzV9ndOhq3Lat88mVfH
 22SUjhhYOAVt4XBOoD5pYh6lkVB1rxkeKQGETviRnQ/LmGFIJ4uRstFK3lzeCdp5s/2s
 0coQ==
X-Gm-Message-State: AO0yUKWRqZWUK2kf9AduwXz341+xnzw3LqSglDAX+mOMeFkjHMhfbdFx
 w2PsCRvKebizCheAKTYl6kf8Z6l6GNhczkk6fnMLbA==
X-Google-Smtp-Source: AK7set8vXuqRilA+FxHrfhh+XgUEF6pav6LFu71/DLhezWMp1B+/h+SJKvMMeAmF2IcWE4Vp71SvnqYOYpnkovDq7AE=
X-Received: by 2002:a62:db45:0:b0:606:653c:f19b with SMTP id
 f66-20020a62db45000000b00606653cf19bmr1311414pfg.5.1677870581040; Fri, 03 Mar
 2023 11:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-67-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-67-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:09:29 +0000
Message-ID: <CAFEAcA9XfB2DX2Qw5mgVbJRumDuNb90VwpXGvR2XeKD8XgXB8g@mail.gmail.com>
Subject: Re: [PATCH v2 66/76] target/sparc: Drop get_temp_i32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 03 Mar 2023 19:09:44 -0000

On Mon, 27 Feb 2023 at 05:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 25 ++++---------------------
>  1 file changed, 4 insertions(+), 21 deletions(-)

Left my review comment on the v1 version of this patch by mistake,
so just copying it here:

> @@ -5762,14 +5752,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>      gen_exception(dc, TT_NCP_INSN);
>      goto egress;
>  #endif
> - egress:
> -    if (dc->n_t32 != 0) {
> -        int i;
> -        for (i = dc->n_t32 - 1; i >= 0; --i) {
> -            tcg_temp_free_i32(dc->t32[i]);
> -        }
> -        dc->n_t32 = 0;
> -    }
> + egress:;
>  }

Stray semicolon after colon, or does C not let you put a label at
the end of a function ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

