Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFXuY-00037j-Nh
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 05:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFXuW-00035y-Bz
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 05:00:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFXuS-0002Pb-C4
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 05:00:43 -0500
Received: by mail-wr1-x431.google.com with SMTP id bs20so14480983wrb.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 02:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ow0Xg9fqIBu4e2PkotUhyl1U82f0HOK/VAHgdwlzzFE=;
 b=CO24vEkujg5v4hiPxAnunIfn31T7BTdFUbO38mGoYbl+Rj/tV/7kgJihoQtF5rMwoE
 aXbOWRyNfmk6SiElkopjyEcalEgG8471fllMqIryKrD1/ZgYGJAWdD54X/gRNDbzgJbl
 qzQDS8IV6Vw37OYqy23lHde6g0t64uYljQ5uiPSJWztQQNGn1oj0hJ9k9FYVKmarB6EX
 QL2CXEHaQha9sUwhJUYNFMkwNJvQnD+m9HwfxszwbvuITV2zGyQTpSdvJ17eZ5y0g9TW
 7mNo7SW4yWXcx/uSAK0qB2NvSBrMVMktU810NBZx6Mgv4cj+sct6fS5Jr338Ukgbw77U
 vCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ow0Xg9fqIBu4e2PkotUhyl1U82f0HOK/VAHgdwlzzFE=;
 b=gmCTts18wmNVSOR0l+uw7Wvg8ZsPWLxulQDn9vHubtIKWbdOjGli9liMR68jzAe8K9
 +OSIiAW6f78uQUDtc7lLlgOyGDQocRn4KM0TcMWA6A1XJP6Eu4p/nyhPf4xxdZoLhCsq
 yT64IQgujtKnK4Q1fXMA/1BC5wC58PqmZ14xulgwbNhD98GzUG0hTCZzCW+lbpbtVsDm
 qIv4GNHm1fJGy1gETp45HMQCq4vhBFkNcW+q0LgSTWxyqrPGKRlLR4GK3Q2UTIH1+Nkj
 MTXixPpH+ai4eJt+l3C8VDgxa0kVrhqJ5cZXXimHBnRJo6NCy5RwaqvHXDlkR1SmhT3W
 BqSw==
X-Gm-Message-State: AFqh2krPoFh5k6nc397dgNKPykGPeF9KtyaJIQekb3cy9ckicgeeJ2GW
 63dMm2B9YD8hDB+o8rgVtO+4AA==
X-Google-Smtp-Source: AMrXdXvS7dtK3h2qoPnbyTssOVrBXo+T4kS61SJCFKGFDIR/o/Uz2Z7d12fXuzM3QyDAV+HnumEzCg==
X-Received: by 2002:a5d:514c:0:b0:2bc:7ec3:8b2 with SMTP id
 u12-20020a5d514c000000b002bc7ec308b2mr5980065wrt.68.1673431237217; 
 Wed, 11 Jan 2023 02:00:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d62c7000000b002bbeda3809csm7777857wrv.11.2023.01.11.02.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 02:00:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4ABEC1FFB7;
 Wed, 11 Jan 2023 10:00:36 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-4-richard.henderson@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 03/36] tcg: Allocate objects contiguously in
 temp_allocate_frame
Date: Wed, 11 Jan 2023 09:59:52 +0000
In-reply-to: <20230108023719.2466341-4-richard.henderson@linaro.org>
Message-ID: <87zgapl7az.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 11 Jan 2023 10:00:45 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> When allocating a temp to the stack frame, consider the
> base type and allocate all parts at once.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 99e6e4e1a8..7e69e2c9fd 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -3242,11 +3242,12 @@ static bool liveness_pass_2(TCGContext *s)
>=20=20
>  static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
>  {
> -    int size =3D tcg_type_size(ts->type);
> -    int align;
>      intptr_t off;
> +    int size, align;
>=20=20
> -    switch (ts->type) {
> +    /* When allocating an object, look at the full type. */
> +    size =3D tcg_type_size(ts->base_type);
> +    switch (ts->base_type) {
>      case TCG_TYPE_I32:
>          align =3D 4;
>          break;
> @@ -3277,13 +3278,26 @@ static void temp_allocate_frame(TCGContext *s, TC=
GTemp *ts)
>          tcg_raise_tb_overflow(s);
>      }
>      s->current_frame_offset =3D off + size;
> -
> -    ts->mem_offset =3D off;
>  #if defined(__sparc__)
> -    ts->mem_offset +=3D TCG_TARGET_STACK_BIAS;
> +    off +=3D TCG_TARGET_STACK_BIAS;
>  #endif
> -    ts->mem_base =3D s->frame_temp;
> -    ts->mem_allocated =3D 1;
> +
> +    /* If the object was subdivided, assign memory to all the parts. */
> +    if (ts->base_type !=3D ts->type) {
> +        int part_size =3D tcg_type_size(ts->type);
> +        int part_count =3D size / part_size;
> +
> +        ts -=3D ts->temp_subindex;

Whats going on here? Are we jumping to a previous temp? What guarentees
there is something at ts - ts->temp_subindex?

> +        for (int i =3D 0; i < part_count; ++i) {
> +            ts[i].mem_offset =3D off + i * part_size;
> +            ts[i].mem_base =3D s->frame_temp;
> +            ts[i].mem_allocated =3D 1;
> +        }
> +    } else {
> +        ts->mem_offset =3D off;
> +        ts->mem_base =3D s->frame_temp;
> +        ts->mem_allocated =3D 1;
> +    }
>  }
>=20=20
>  /* Assign @reg to @ts, and update reg_to_temp[]. */


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

