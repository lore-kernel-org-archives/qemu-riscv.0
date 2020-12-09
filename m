Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn83F-0000rN-Nf
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 17:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn83C-0000qm-6u; Wed, 09 Dec 2020 17:35:10 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:36014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn837-0001dL-Gs; Wed, 09 Dec 2020 17:35:09 -0500
Received: by mail-io1-xd43.google.com with SMTP id z136so3420099iof.3;
 Wed, 09 Dec 2020 14:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XL4cCsOBVXs7f2Royc+YVynPM7yi4LEYQ+qJoRigKXU=;
 b=iiByqgnq8pj/G7VQs7J9R9s/4N6Bvs9ySBws28PGOoFSfn88PbqKSaGhH1+VLgk9a4
 2YqSMlBIxSW87AkRpjzWNu6n+TgeGmK7HwO6JwxgJ29NmgFEe6RNk3ewsDSwjKLMxKQT
 Groo9Vr2BTJCGk0/4zOB85x2eDV9pj6o8C5m4lei9FtdoWeB90HCIAEyhJux6YGaEzRp
 FbkXI7IvA0yyoxBYAjrbcV8MQOU+8b9h2NGyHDVbyLN/hDAr0AWEfTu2UtgUY/053mt7
 zeIr+lOGRVUJb77NjimvKj20zrmFldn8PCeckoTzYGod1T5DjDqq2WvQ7dcxdCVmWhJK
 fpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XL4cCsOBVXs7f2Royc+YVynPM7yi4LEYQ+qJoRigKXU=;
 b=QefpZlUAkkbGQbiE+R/aea1nL0fKVDcwnqEsb/gqxRYhGKk4c29Ugxfebiy4fJM2AP
 87zBPS7zMaaJn9hI0bvi/Jy9WLmGItJAziRfq0gvxHcMbrspKHgAU7TnHOPmFB13Hlr1
 bFlAV7LG5w+uSrHSTm8b/H65ckNe8iy+CcLvUHVFFWUxjVo88iP47X9qq0s686fqrEz/
 BGWRem/6Dr/xcrn6mPOHjsNcor+GdyPOgKlY/JI5INi6ZB6gGDJXkBPaup6/AMvqWj5P
 26YuGu5+kjlXKxe8+GOVwpcbaeMDQ8edBYTCn8TAHkiIoVqPbWlQlB1f316OuVlzR+Jk
 J5lA==
X-Gm-Message-State: AOAM533l3LcbCCLGq2JwXZjpmDkTO/h7yGuI6iRim01Wc/V8f4vBRAJo
 TzxmW0k4N3nFZ+xAzfCXoxh3uD6kxnys/KEN708=
X-Google-Smtp-Source: ABdhPJyNCulFQquzTjND2z4ZH3VNsdH4w5ChF6cNrzxYwTqJyPCy2NTpDQf9XQ2/vkbg7mrfSXAea4Je2HJVUrJXh3k=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr5815705ioq.176.1607553303042; 
 Wed, 09 Dec 2020 14:35:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <7d7d148b9d4a3bcc86387d7b0d8005f114ade8be.1607467819.git.alistair.francis@wdc.com>
 <e0dcaf5f-a41d-d578-273a-34de2da034d3@linaro.org>
In-Reply-To: <e0dcaf5f-a41d-d578-273a-34de2da034d3@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Dec 2020 14:34:37 -0800
Message-ID: <CAKmqyKM8gT8n8ZYFkQJCWeyYiYtzTBLHNVdes5+_0Hj4dRLGmw@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] target/riscv: csr: Remove compile time XLEN
 checks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Dec 2020 22:35:10 -0000

On Wed, Dec 9, 2020 at 9:34 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/8/20 4:56 PM, Alistair Francis wrote:
> > @@ -1053,11 +1077,11 @@ static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *val)
> >          return -RISCV_EXCP_ILLEGAL_INST;
> >      }
> >
> > -#if defined(TARGET_RISCV32)
> > -    *val = env->htimedelta & 0xffffffff;
> > -#else
> > -    *val = env->htimedelta;
> > -#endif
> > +    if (riscv_cpu_is_32bit(env)) {
> > +        *val = env->htimedelta & 0xffffffff;
> > +    } else {
> > +        *val = env->htimedelta;
> > +    }
> >      return 0;
> >  }
>
> Certainly this mask was useless before the patch, because of the ifdef and
> target_ulong.
>
> Afterward, target_ulong may be larger than uint32_t... but what does the rest
> of the value, and the register into which it is stored, represent?
>
> Are you going to keep the register values sign-extended, as-if by addw et al,
> in which case casting to int32_t would be better.  Are you going to simply
> ignore the upper 32 bits, in which case dropping the masking entirely would be
> better.

We are just going to ignore the top half, so I'll drop the mask.

Alistair

>
>
> r~

