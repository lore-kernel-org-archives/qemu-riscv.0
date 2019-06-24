Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfLKU-0005kK-R1
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jun 2019 05:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57087)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hfLKP-0005i0-P6
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2019 05:32:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hfLKN-0000Wh-Gp
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2019 05:31:57 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35087)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hfLKJ-0000CL-FM
 for qemu-riscv@nongnu.org; Mon, 24 Jun 2019 05:31:53 -0400
Received: by mail-pl1-f194.google.com with SMTP id p1so6568898plo.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Jun 2019 02:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=W0G8UeOjcso8Plch7kD+AA0OuDIm7xzN3rImXUDGpfY=;
 b=gLEN6muzim5wW+bzcc+JU+aUZl+pksu1KVokGTW75uXE99NQh5gtyEgEuHQ8sQDrZ5
 BYbIxo8KfGoWzAdAHPMglAFsUmeXy98w5sqOl2k6Hk7vqjvL6OEVEPLPVZelvNOtjg4v
 49lkyhjUrrPuA828ZXdjj1HDEeZ30isGdg/3CPR1OWHjPwlfnRnFhPByTIEBt11qlzXE
 GoUg1P/OQiLNeDSfzgvzUGkPywL1PoDwWB2/BMTJGEDryMYcO2Kc2UrjXfeWjhznczUy
 qhCgxHk6gUSVBxhb4BgD0wMlrk6Lgn9d9s+dwrS0rzgVjS2/zodOZiphOyeCL7NeTA5v
 q7Sw==
X-Gm-Message-State: APjAAAXJPAcP7DCgz6l5vh/rgSanmLiJmv583SZNTK+kHZdvgpvqVDUI
 HlkK9Hme/EG9ZBSzF1RjSq/tPw==
X-Google-Smtp-Source: APXvYqwduhZ6O3VThmozQrPRTHtToGNcnAC6dO1xditU7i/RAqJcTkgqjWNVUGcjohCnqH6oVz1m2g==
X-Received: by 2002:a17:902:e40f:: with SMTP id
 ci15mr68842797plb.103.1561368702386; 
 Mon, 24 Jun 2019 02:31:42 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id e188sm789323pfh.99.2019.06.24.02.31.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 02:31:41 -0700 (PDT)
Date: Mon, 24 Jun 2019 02:31:41 -0700 (PDT)
X-Google-Original-Date: Mon, 24 Jun 2019 01:23:27 PDT (-0700)
In-Reply-To: <b9cb270c4356301ca15d6fec3f651da64beb57d3.1560821342.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-e848dd5f-d245-421a-aafc-857a10800e30@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.194
Subject: Re: [Qemu-riscv] [PATCH v1 3/9] target/riscv: Comment in the
 mcountinhibit CSR
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
X-List-Received-Date: Mon, 24 Jun 2019 09:32:01 -0000

On Mon, 17 Jun 2019 18:31:08 PDT (-0700), Alistair Francis wrote:
> Add a comment for the new mcountinhibit which conflicts with the
> CSR_MUCOUNTEREN from version 1.09.1. This can be updated when we remove
> 1.09.1.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 1 +
>  target/riscv/csr.c      | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 47450a3cdb..11f971ad5d 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -136,6 +136,7 @@
>  #define CSR_MCOUNTEREN      0x306
>
>  /* Legacy Counter Setup (priv v1.9.1) */
> +/* Update to #define CSR_MCOUNTINHIBIT 0x320 for 1.11.0 */
>  #define CSR_MUCOUNTEREN     0x320
>  #define CSR_MSCOUNTEREN     0x321
>  #define CSR_MHCOUNTEREN     0x322
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c67d29e206..437387fd28 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -461,18 +461,20 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> +/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
>  static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -    if (env->priv_ver > PRIV_VERSION_1_09_1) {
> +    if (env->priv_ver > PRIV_VERSION_1_09_1 && env->priv_ver < PRIV_VERSION_1_11_0) {
>          return -1;
>      }
>      *val = env->mcounteren;
>      return 0;
>  }
>
> +/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
>  static int write_mscounteren(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    if (env->priv_ver > PRIV_VERSION_1_09_1) {
> +    if (env->priv_ver > PRIV_VERSION_1_09_1 && env->priv_ver < PRIV_VERSION_1_11_0) {
>          return -1;
>      }
>      env->mcounteren = val;

I don't think this one is right: this should be unsupported on 1.11, as the
semantics of this bit are slightly different.  It shouldn't be that hard to
just emulate it fully for both 1.09.1 and 1.11: for 1.09 this disables access
to the counters (which still tick), while for 1.11 it disables ticking the
counters (which can still be accessed).  Since we don't do anything with the
counters in QEMU, I think this should do it

LMK if you're OK with me replacing the patch with this

commit e9169ccd5ca97a036de41dad23f37f6724712b90
Author: Alistair Francis <alistair.francis@wdc.com>
Date:   Mon Jun 17 18:31:08 2019 -0700

    target/riscv: Add the mcountinhibit CSR

    1.11 defines mcountinhibit, which has the same numeric CSR value as
    mucounteren from 1.09.1 but has different semantics.  This patch enables
    the CSR for 1.11-based targets, which is trivial to implement because
    the counters in QEMU never tick (legal according to the spec).

    Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
    [Palmer: Fix counter access semantics, change commit message to indicate
    the behavior is fully emulated.]
    Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
    Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 47450a3cdb75..11f971ad5df0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -136,6 +136,7 @@
 #define CSR_MCOUNTEREN      0x306

 /* Legacy Counter Setup (priv v1.9.1) */
+/* Update to #define CSR_MCOUNTINHIBIT 0x320 for 1.11.0 */
 #define CSR_MUCOUNTEREN     0x320
 #define CSR_MSCOUNTEREN     0x321
 #define CSR_MHCOUNTEREN     0x322
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c67d29e20618..2622b2e05474 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -56,6 +56,14 @@ static int fs(CPURISCVState *env, int csrno)
 static int ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
+    /*
+     * The counters are always enabled on newer priv specs, as the CSR has
+     * changed from controlling that the counters can be read to controlling
+     * that the counters increment.
+     */
+    if (env->priv_ver > PRIV_VERSION_1_09_1)
+        return 0;
+
     uint32_t ctr_en = ~0u;

     if (env->priv < PRV_M) {
@@ -461,18 +469,20 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }

+/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
 static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    if (env->priv_ver > PRIV_VERSION_1_09_1) {
+    if (env->priv_ver > PRIV_VERSION_1_09_1 && env->priv_ver < PRIV_VERSION_1_11_0) {
         return -1;
     }
     *val = env->mcounteren;
     return 0;
 }

+/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
 static int write_mscounteren(CPURISCVState *env, int csrno, target_ulong val)
 {
-    if (env->priv_ver > PRIV_VERSION_1_09_1) {
+    if (env->priv_ver > PRIV_VERSION_1_09_1 && env->priv_ver < PRIV_VERSION_1_11_0) {
         return -1;
     }
     env->mcounteren = val;

