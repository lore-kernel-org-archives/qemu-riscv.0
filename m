Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipM0j-0002lq-6a
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 19:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipM0a-0002gp-5F
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:49:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipM0V-00080n-I4
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:49:06 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53539)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipM0V-0007xj-7S
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 19:49:03 -0500
Received: by mail-pj1-x1043.google.com with SMTP id n96so357007pjc.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 16:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=oxaYPFpeBulaqXEI8e0zvCoQvUmXj9BsGZbI3S9AAPs=;
 b=nkBNJ+gTd8TFhEZGeXvAhmb3pYpL/KVs8I7Ll0TdBovsXPpv8syPKMpVdE/iLvJ4uX
 WhAQlZGJUWMX4NHeo+/1Tjbzo3G/nbanH2qbJEj/mEq+TsjtbapakzX3ogb4gKy0dKRe
 QJ9NmNtft7veyc95li3xo8mpeqRYxBFfVWHnKmxcgEx4yiZv0Ak45yiwjXHOsO5kNQfE
 JHoef3ZolmCHbGOJDpEgzZSKl/S3dt5Rw2sH95Z+KW76KaLwvHJNKNL61yDZaqjfH+sY
 qj7YV+eM7DHHNaPvi2pGhdkOapeCTr6ma63o7WEOjDT2qIc6noE7zXiyT6Y10PSXDZHg
 s1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=oxaYPFpeBulaqXEI8e0zvCoQvUmXj9BsGZbI3S9AAPs=;
 b=VRFHxW0Qau9r7RZMPWacM8XCMitu/poP4hi9IZvdURb47Qbayb+tNRP6bvnDc7JVTF
 wjf5uaCYg+IKFD9jPEaAYbw8oPyefZbrDTiyY9J4NPMeA6qsrcF/I8u0ykeu7e+oisYc
 Of5pG94XMwMHFS4lnqk2rSAC32DU+wzSTJIIJZD+Bel8YkUF+owAJBDwTjyPCX+rQ0Iy
 9XHbUkMRRq/y0bVC7+I2k9swrKxLn+6VgBjby/yx0p49facJHaHOwogYILnLBRrAEcmY
 uNMfrCj+5siEPH+OWiopXcAr24bPPNZaL/5DQKyIMDej83doqdTMHZiuYCagiExFrYoh
 E7Iw==
X-Gm-Message-State: APjAAAV8c7PuseqZ1noJctjThhMtdERGY9+UUg5pH8W7xZdSNPvbwFp6
 1N0L4m+BJAm1Oh5OEVIsJa9IUg==
X-Google-Smtp-Source: APXvYqxtbOAz2lj1ecTrwijbnMiRA6uUhDyK2H/O8kDV8Edf+yj07PhtKh5x2enJPb5STdwsU55V+g==
X-Received: by 2002:a17:902:34d:: with SMTP id
 71mr8391407pld.140.1578530941637; 
 Wed, 08 Jan 2020 16:49:01 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id w7sm451134pjb.31.2020.01.08.16.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 16:49:00 -0800 (PST)
Date: Wed, 08 Jan 2020 16:49:00 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 14:40:34 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 19/36] target/riscv: Extend the SIP CSR to support
 virtulisation
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <eecc3f2848d9afa8e640f608bd13112868ca2e5f.1575914822.git.alistair.francis@wdc.com>
References: <eecc3f2848d9afa8e640f608bd13112868ca2e5f.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-d8e48454-f32d-4bff-8601-38ad43e83134@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Thu, 09 Jan 2020 00:49:10 -0000

On Mon, 09 Dec 2019 10:11:30 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 54edfb280e..d028dfb60b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -744,8 +744,19 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
>  static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>                     target_ulong new_value, target_ulong write_mask)
>  {
> -    int ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
> +    int ret;
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        /* Shift the new values to line up with the VS bits */
> +        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value << 1,
> +                      (write_mask & sip_writable_mask) << 1 & env->mideleg);
> +        ret &= vsip_writable_mask;
> +        ret >>= 1;
> +    } else {
> +        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
>                        write_mask & env->mideleg & sip_writable_mask);
> +    }
> +
>      *ret_value &= env->mideleg;
>      return ret;
>  }

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

