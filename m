Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOTOO-0003nE-7V
	for mharc-qemu-riscv@gnu.org; Wed, 08 May 2019 16:42:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hOTOM-0003mp-0T
	for qemu-riscv@nongnu.org; Wed, 08 May 2019 16:42:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hOTOJ-0000hN-SF
	for qemu-riscv@nongnu.org; Wed, 08 May 2019 16:42:17 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hOTOJ-0000g8-Gl
	for qemu-riscv@nongnu.org; Wed, 08 May 2019 16:42:15 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so10466235plr.7
	for <qemu-riscv@nongnu.org>; Wed, 08 May 2019 13:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=VgyXF7ytFjodUj+gOQnaY7QDddkV2VcxBgtSMevZxes=;
	b=dQvVsk123TSJu4CRGaDe6IesE4fKY1snaNc5hJutuPE4AhExCy90RLV02RtrEOsVpH
	5fVDDrUtVC1c44dVy6zSwP9SMJC2EH14ibFae4yv0LkISEpSptnRLBNJWVvytK+VHGpr
	Be6yPollztMb44beAwu0vS4UZrUdrOISNP2QSFXwmGPS2fGjYmEmNk+46VefK7CiLHA3
	+dRB1e/hn5KGNoIL3LNxYQVcVJPZnEoOCzOKNMtj1gOpWiTm7n/Gd6z7F1icVIvdC8Sr
	x+2bwLx6hq/ZszPYLZvZBFU2UWIVsfqH30KugqF85wi0DzfzYJcr06N3oMcdhr+NeIOj
	0qJQ==
X-Gm-Message-State: APjAAAWCwR61QeQWcLqOaQZRIR5mUyoR4/WsJrQSEGMtSUYa+7mih4ps
	OzBpTp6J2LDC79j+Jm5ZtsomMA==
X-Google-Smtp-Source: APXvYqzX1CSL1eBLsWHRghkkaBK8mhiYxSRkPCTUQ+BE4pndbij8Kv1gJwmv9RDqLbbVveLv82OFiA==
X-Received: by 2002:a17:902:ba8e:: with SMTP id
	k14mr50786062pls.80.1557348132885; 
	Wed, 08 May 2019 13:42:12 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	t65sm129557pfa.175.2019.05.08.13.42.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 May 2019 13:42:12 -0700 (PDT)
Date: Wed, 08 May 2019 13:42:12 -0700 (PDT)
X-Google-Original-Date: Wed, 08 May 2019 13:30:52 PDT (-0700)
In-Reply-To: <20190508173835.14528-1-jonathan@fintelia.io>
CC: qemu-devel@nongnu.org, fintelia@gmail.com, qemu-riscv@nongnu.org,
	sagark@eecs.berkeley.edu, jonathan@fintelia.io
From: Palmer Dabbelt <palmer@sifive.com>
To: jonathan@fintelia.io
Message-ID: <mhng-80bf675e-e5bd-4102-9ecc-484829735eb8@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.193
Subject: Re: [Qemu-riscv] [PATCH] target/riscv: Only flush TLB if SATP.ASID
 changes
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 20:42:19 -0000

On Wed, 08 May 2019 10:38:35 PDT (-0700), jonathan@fintelia.io wrote:
> There is an analogous change for ARM here:
> https://patchwork.kernel.org/patch/10649857
>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> ---
>  target/riscv/csr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6083c782a1..1ec1222da1 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -732,7 +732,9 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
>          if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>              return -1;
>          } else {
> -            tlb_flush(CPU(riscv_env_get_cpu(env)));
> +            if((val ^ env->satp) & SATP_ASID) {
> +                tlb_flush(CPU(riscv_env_get_cpu(env)));
> +            }
>              env->satp = val;
>          }
>      }

Thanks!  I've taken this into my for-master branch, pending some testing I'll
send it up.

