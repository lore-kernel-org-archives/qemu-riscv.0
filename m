Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSFsL-0000Xb-IL
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 06:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsK-0000XE-Qt; Wed, 15 Feb 2023 06:23:00 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsA-0000hT-4q; Wed, 15 Feb 2023 06:22:51 -0500
Received: by mail-ej1-x62f.google.com with SMTP id rp23so47352162ejb.7;
 Wed, 15 Feb 2023 03:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dO2T3BV9HfeMt8va9UU3halitt10Qi1VXdPTVqLtIcc=;
 b=Be+6eYXEhKF+ZCIzUs56qGAl65uNZTTXdyyAbGtfsxd2aHgRgSrdQMvt8KW1Wn9c53
 5tvySNHaSr6/NOhE/Lq8lMqVATe9AIAV/TBKBQ5yRaMct6lkBZltZN4Tt27ywKvv7BMv
 jFM0gSOrjSXjz4lOxx3uKpcAn9Sc4q+gi8I75QNKuTiyARGoo1JLXZHvsPLzQnGDHWER
 j7ZdIYQboLJSu9aOiH+Zr5irU2Ky1SIFYX8Qf6jImuBoLiBlCL2So76QvwIuS/cWwQy7
 N5Ua91/S6q7mrIYbtr2ZL/eZqjg3X3JGBjgQUlPn2SHzvcW2hiwrZQAuy31sb5I/oFqm
 RnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dO2T3BV9HfeMt8va9UU3halitt10Qi1VXdPTVqLtIcc=;
 b=21KdMEFwYg2SjJdXkiucb31/FGglVnjlNoEihTxge1a0snK3LdxKwyrlVbY+fs2nhu
 xb9kux4fqdxQgVjBQQGPAwEwwTk+thLTBKIqli0t5hnsgdhLa9an6XEcrelL0fq7zzR6
 X6GGjtDl8D3iC+BllEOerbygLBRpF1E9aQT3dKGPwtOsg6GqNcZlV9HZuTX7NehiJldh
 Kn6s1fZ6jRayQG6klsGMtQ+bo1toskrRk3beeu/nkQ62m4rbkUhNA7zlVXQC7xkI+kkT
 Tq0W4LYs8VpysQHKC2eBLMVv1Vuu4YcYzJmxx6pWzWbr5ZkwP3LPgkIgEsrWj85Py6Fh
 JLBw==
X-Gm-Message-State: AO0yUKVoUS3TpHFcQzVepomnKrkyhxj1CPqwNul3MdThDmG5Fnlb3434
 4/6bboew3mCaG32RSvq+pPS5COrnbUU6vvlsDMo=
X-Google-Smtp-Source: AK7set8eCrVwgcOdKZWZNz5WdZgpGCeHh9cm1Bn6m/4t7DJ9xvDMLb73o01nG1GCDjS6iqwwan9Jg7tAZbBoftgtAA8=
X-Received: by 2002:a17:906:3b10:b0:886:4b7e:c1dc with SMTP id
 g16-20020a1709063b1000b008864b7ec1dcmr914510ejf.6.1676460168031; Wed, 15 Feb
 2023 03:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-3-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 19:22:36 +0800
Message-ID: <CAEUhbmUPG5XqsZcqx9UiLjvv-XRXdkn=cykB3WTzrp00cCUhKg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] target/riscv: introduce riscv_cpu_cfg()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 15 Feb 2023 11:23:01 -0000

On Wed, Feb 15, 2023 at 3:26 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We're going to do changes that requires accessing the RISCVCPUConfig
> struct from the RISCVCPU, having access only to a CPURISCVState 'env'
> pointer. Add a helper to make the code easier to read.
>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.h | 5 +++++
>  1 file changed, 5 insertions(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

