Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0upS-00022e-Ho
	for mharc-qemu-riscv@gnu.org; Tue, 06 Jul 2021 19:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upP-0001v1-Ua
 for qemu-riscv@nongnu.org; Tue, 06 Jul 2021 19:50:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up9-0006h5-6X
 for qemu-riscv@nongnu.org; Tue, 06 Jul 2021 19:50:11 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ie21so473239pjb.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jul 2021 16:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fah/7+FGmIwtKdVPZBEODDrAFrXPTjGeDHD95pFERbE=;
 b=ksswvOHQhba9y4Izx2jdxdkz42vbhrHBMWT6zLvAeo9EcJTfj/jppBcA8rNJLWzh0w
 TInd+RizqrLVcKHoUiygU3vjk6m2C+03VyX6A2/SqrBhydvw2tYOA+IE2fKG2W7q33gN
 0O/G2GXNc9fgdy5YPhUhzmyf1SGdMXnlfU9qKm5xd+qalWT4tHgH9HWE79hRfuhXKH3B
 wyWxOSnvLSVer2N9rnIAGaWekGR4GPLidVOGCxU8uOUj6xav8oSBkHkdX/1oVLaBBl3D
 sQEpQ7sRJLSNHQeOcuPv4eIWIiNqZMEERd3+a6mmbOOC11dYZf5nVmXxrD6i8N+yBeMd
 slGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fah/7+FGmIwtKdVPZBEODDrAFrXPTjGeDHD95pFERbE=;
 b=sFEDxftgyCXRzyxrd6p3NVUmCO0R8wu3poctqksy3pz4LSlf5tUf3vmaH66yfixe9k
 1j0KztMtxLU4sIFrGYFDxeCTZaU06FXwVEnb5mPMmzBYyy6QJwIBUlB7NAXqxZ7XoeUc
 6Pzy/U3QPjb7XJqt/VlahuPAdcwr5DutnyP2Ngl7b124C3apVW6+AKOTHUm4L1ZYXay2
 eSGJRsjhw11zNTd6AdhnsyawWSUUEBzfpKBIoVeXAnPQq+A7C+gp2U/HFrMoc+nWDs/t
 z7gCQSk7aj3jRX/cA66xJ1wbON0goKeDan1H8JL70jQPsaNU9VNvaUPZzjflepD9/RcP
 h7Lw==
X-Gm-Message-State: AOAM532QKLBdrbQClNMOQq6K4cWhbahcBv7zXi48cdGtpTYlWVo/hLiO
 mkOcXxl16qHjoWjcFRKTcICAJA==
X-Google-Smtp-Source: ABdhPJwZCxDzoAYdPRJ41IjheOMDWpcWsv694Rj/0pCJT9gXn3xoWn0TibQa8Tjbl93L6MQo2PrmEg==
X-Received: by 2002:a17:90b:787:: with SMTP id
 l7mr23243602pjz.110.1625615393746; 
 Tue, 06 Jul 2021 16:49:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 32/36] linux-user/riscv: Add vdso and use it for sigreturn
Date: Tue,  6 Jul 2021 16:49:28 -0700
Message-Id: <20210706234932.356913-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 06 Jul 2021 23:50:12 -0000

Building the vdso itself is not actually wired up to anything, since
we require a cross-compiler.  Just check in those files for now.

This fixes a bug wrt libgcc fallback unwinding.  It expects the stack
pointer to point to the siginfo_t, whereas we had inexplicably placed
our private signal trampoline at the start of the signal frame instead
of the end.  Now moot because we have removed it from the stack
frame entirely.

Cc: qemu-riscv@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c           |   4 +
 linux-user/riscv/signal.c      |  10 +-
 linux-user/meson.build         |   1 +
 linux-user/riscv/Makefile.vdso |  11 ++
 linux-user/riscv/meson.build   |   9 ++
 linux-user/riscv/vdso-32.so    | Bin 0 -> 5624 bytes
 linux-user/riscv/vdso-64.so    | Bin 0 -> 6120 bytes
 linux-user/riscv/vdso.S        | 207 +++++++++++++++++++++++++++++++++
 linux-user/riscv/vdso.ld       |  76 ++++++++++++
 9 files changed, 309 insertions(+), 9 deletions(-)
 create mode 100644 linux-user/riscv/Makefile.vdso
 create mode 100644 linux-user/riscv/meson.build
 create mode 100755 linux-user/riscv/vdso-32.so
 create mode 100755 linux-user/riscv/vdso-64.so
 create mode 100644 linux-user/riscv/vdso.S
 create mode 100644 linux-user/riscv/vdso.ld

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 43c985f318..782d2904bc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1484,10 +1484,14 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 
 #ifdef TARGET_RISCV32
 #define ELF_CLASS ELFCLASS32
+#include "vdso-32.c.inc"
 #else
 #define ELF_CLASS ELFCLASS64
+#include "vdso-64.c.inc"
 #endif
 
+#define vdso_image_info()    &vdso_image_info
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 9405c7fd9a..fe7cf7723b 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -46,7 +46,6 @@ struct target_ucontext {
 };
 
 struct target_rt_sigframe {
-    uint32_t tramp[2]; /* not in kernel, which uses VDSO instead */
     struct target_siginfo info;
     struct target_ucontext uc;
 };
@@ -104,12 +103,6 @@ static void setup_ucontext(struct target_ucontext *uc,
     setup_sigcontext(&uc->uc_mcontext, env);
 }
 
-static inline void install_sigtramp(uint32_t *tramp)
-{
-    __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
-    __put_user(0x00000073, tramp + 1);  /* ecall */
-}
-
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPURISCVState *env)
@@ -126,14 +119,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_ucontext(&frame->uc, env, set);
     tswap_siginfo(&frame->info, info);
-    install_sigtramp(frame->tramp);
 
     env->pc = ka->_sa_handler;
     env->gpr[xSP] = frame_addr;
     env->gpr[xA0] = sig;
     env->gpr[xA1] = frame_addr + offsetof(struct target_rt_sigframe, info);
     env->gpr[xA2] = frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->gpr[xRA] = frame_addr + offsetof(struct target_rt_sigframe, tramp);
+    env->gpr[xRA] = default_rt_sigreturn;
 
     return;
 
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 8021044053..e581d5ceba 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -35,6 +35,7 @@ subdir('microblaze')
 subdir('mips64')
 subdir('mips')
 subdir('ppc')
+subdir('riscv')
 subdir('s390x')
 subdir('sh4')
 subdir('sparc')
diff --git a/linux-user/riscv/Makefile.vdso b/linux-user/riscv/Makefile.vdso
new file mode 100644
index 0000000000..de55a0b9f9
--- /dev/null
+++ b/linux-user/riscv/Makefile.vdso
@@ -0,0 +1,11 @@
+CROSS_CC ?= riscv64-linux-gnu-gcc
+LDFLAGS := -nostdlib -shared -Wl,-T,vdso.ld \
+	   -Wl,-h,linux-vdso.so.1 -Wl,--hash-style=both -Wl,--build-id=sha1
+
+all: vdso-64.so vdso-32.so
+
+vdso-64.so: vdso.S vdso.ld Makefile.vdso
+	$(CROSS_CC) $(LDFLAGS) -mabi=lp64d -march=rv64g -fpic -o $@ vdso.S
+
+vdso-32.so: vdso.S vdso.ld Makefile.vdso
+	$(CROSS_CC) $(LDFLAGS) -mabi=ilp32d -march=rv32g -fpic -o $@ vdso.S
diff --git a/linux-user/riscv/meson.build b/linux-user/riscv/meson.build
new file mode 100644
index 0000000000..475b816da1
--- /dev/null
+++ b/linux-user/riscv/meson.build
@@ -0,0 +1,9 @@
+gen32 = [
+  gen_vdso.process('vdso-32.so', extra_args: ['-r', '__vdso_rt_sigreturn']),
+]
+gen64 = [
+  gen_vdso.process('vdso-64.so', extra_args: ['-r', '__vdso_rt_sigreturn'])
+]
+
+linux_user_ss.add(when: 'TARGET_RISCV32', if_true: gen32)
+linux_user_ss.add(when: 'TARGET_RISCV64', if_true: gen64)
diff --git a/linux-user/riscv/vdso-32.so b/linux-user/riscv/vdso-32.so
new file mode 100755
index 0000000000000000000000000000000000000000..0925aae9f50145bab6ef5d1da4a58c2dcb2ebec3
GIT binary patch
literal 5624
zcmeHLU2KzO6n?*!!WeAqFi>z)fq_hvy5SI%iTmpqP{uMgord_ewB0)0I&3>K$iiEN
z5Ml@{LJT3q3?zgYLl!ke4N(&lHR=r!6R(UnMz4$p{7D4n^L$_5(jg{Zc;Q9Q_Uydp
z=RNP=`Ielc1Ho3yvXmjOx}qGZOsP63N6M9&241HYsp+a(m8m)4u8nr$qb%r0+>8bR
zwB6@|^AI2xpJU=27y&m&_JA!w5QF282@}8L`*ifU7rHF!VIz#4{AwPSVoc=Q=RwAF
zwV}ORUAq4JCtn`kJbAhA>*jA0=U=GFT>7pQwsdw*3pVuYjme==aPILUIL|VHJr;u>
z0cHU_&J2K5<T5oAd^T`xa&jny1+Rnid_RK+xq<(H8W<4d#R;9e$3}V}&&A3sz;{CC
z9w_ezHzewp$q<B-uyen(&j%0X`3E77<=NLm&g9woMmz@3NzU^-?+k9pc~=NrgKt3M
zmg!GUaE>K2Ya3Nr8D;u8clmk6#I_?f@ycU|CeOY%xOm~~&58Q?pPpDgu_LBzdsj3y
zWcS6=>HfjkP;WH6+vp+#Ly_l=<!{PlEM;_<9N9T+q~3wyRNU^5gd_1>_+;8n_4g%X
z>EUET4fH35M^<uKKYnXfaASLSk6q`lU5yQcJX3y{>+a8~4}U6Q&Q$`;D-z$zgTKT2
zhho}D=6$RR@4B^+c`tE1UI+MR;BoM8z(>J<1Rn$c1N;oQDsgiX&*PAHPp7g*Evur$
zqZoeyPzGP-hUzF?6h)HLw+85e9={Gz*8+6iqT{@dTXX}^1)($feibqaYj4Bi4OYc$
z&$!3epv2lMo>B4ck!d61+a=S}G9xKPJ7s1<iU(xYb22+FCB0G_l{q`4EF|)*%-t^K
z&&a$Ung68R(It0w%7PAA*e-VkrDBs*w#nVCa!-rg+a!w`Wbp@DmR!_Q^}d#+?`m0g
zLCbybXj%T2mg)&D_n+6Y;!Q0NyrJd6b6QrO)#5*+<)PDBYR0wHzNTf>Ni7eb&{B6?
z%j#FPJaSCSnpd=}9n<pYVJ(jx(z5PlE%gVrJbpmS`u$p-cuC{Dyt8XS8~zdCIto;{
zfx-<GZlG`jg&Qc`K;Z@oH&D2N|K$xt4)|2nIB?ph$}Q_gRrM)V?z7a<qMC&%?0DZ2
zOL?mr)xN41)xKqx1s_kO%;zchb^IBr^ukxE^3u%ux4-(>TQ%N|IK!$h10CiPCXUe^
zEebhtZ_1fsu481zGvlL06GgQB6Xj|Rr;>8}1@!eg6{TAXxw6*@(ZIqI#5$S8x}M~9
zI}eKWy(_yFEbDw%cB^_*uY0rAPRI?5`K*53euV4Ku7FaPb9QzIKr9kKUQ`II{a8Db
zEY#tgF_E=XUJ9B04VQ}58Vt<-Y2RW@;H=|Wo8{N(tjo9_^{neN;2FrQO(-7*&#(JW
zL(cCLT!0+P^H+Au)9sC0Ha07}qjPI>pryMrV59im+_)iNcQrNz12$@CbW`j=o88*k
zxFuk>wR9?bLvU+TW6<8(+PW>!WgPR0=4=UnySn>!W&PA@eM)7Xjg%|=^J@H@j%@;^
z{Hfi8>F^HlbkgN<GfE7lW6B@hod^&1N1OqC!NcjW^7kc%{qb-r?&{M?SF<aYO!W^X
zrU-Ua`D1arHyIv`+3_emjimhP*hm_e`!A^ie#}0mBJ-VKZWwYiS*gWPFl(7I`F%4t
zbKQOlYjpO5n2n6b{uMEXu~~!h@a$?8!1QE1<{e?yg31|Ft_RrPVLX0M#9E9^>e7dx
z?ze33i{Ba10Nt&AO<5hxPM?k6Ap2{ExF^ykU@{wz-z6~@IunociKhV5a|^*pa4-4i
zg{XP~#^#*-z9K}2%-Q*L#*g1OanNiEHsiN9>*xF@;e`U{zzk7EGO=6<J}_jUWdBhB
h#-p$4uVLs=H4giQ5x~tBI0swG(G~dZ&q+7^{sKo*m>d8A

literal 0
HcmV?d00001

diff --git a/linux-user/riscv/vdso-64.so b/linux-user/riscv/vdso-64.so
new file mode 100755
index 0000000000000000000000000000000000000000..75fe1db977ee1de538963a062e4da7c337ec6a54
GIT binary patch
literal 6120
zcmeHLU2GIp6u!Gdp|l0|6i~3JMNzQA+9C+b-?Vhgk4xK>5^G{IU3RzK#&%0~r=*zX
zP9OT936Um1LW~do5aWZ1O*94*6Y(cX&=_KjA;uUq{xrsrsz{7M>Nzv#EVI)Z6JLCA
zPnrGh{mwb}+&OdaFy}h4cuP1GQX+=>Rk^*0$C#{`T<kUGAed^inv1^?wFprukMs1V
z2dMR=ore}IXP#*C{X4nBN<j?f3i*{$i~B+Bbgh&U6nz+Zn&%mwPY~;w7nFIne`lx2
zuhtDZ6Ss0aL9!(wq-&hV4dN;?LJ=fe62c{T8F=k#J)mA|*wOa2GAiHOcCzVocbW6l
zJ9}S6m0CzYD7FW#A2rXBBg${rrw82z56sh7Cif-xlav^g3J=sV#!ALzjPn=;BtO!h
z&keD^Htofq<amE_pTnss?q6WNjPqZhf!RCDd6W3`*s4`kVVz;il{)5YdHo4LhCHaB
zr#-71zunlRapG(*d0WbSBrr~#c{5<Yo%#BJy{u!JK0O0MdRFp$vFVCDe~K?Dr)NR-
zgmk~;6N)ScGo<Q?BRluGpRbwNf2=;U;>6MEm);y$x%|bQ*{w@Id}j5;!L+ih!>RnB
z)tk2MzJc^$PbzUlxMcre@^R73Aam)waOj*oG$g&A{-J!v>Pse)nZocn+sgO#=F;|1
zF01<cvO~k`C~Oq}HK_QW)&pJEhG@e^oG?nb=+EOqc!%`&{M(lo(EeJ1m+T$7_b}>)
zoF6JkM?%k&BvfN;p}kGHxrCdf6LAVLgQ#$mj37i1#}R80Pb02DJj?r@AD1$o=un}N
zP^e}>*nK6@J{iMtWc`rcTD(RBoQd2>fTKAK2RNFKjhw8nIUFD3?#IApsHQ4B5iT<o
zghn7d42BJJ4nbKz%+0{O6qI+v{Kuf83o1LIsvQ=@Vc~9A)C>_5;4KHL&p5F7bqAJA
zII#2;2X1=Vftyb|u<SVpmOtyjEvFo)IpM&HaR+Wa>cDMJI&k}#1GS?Lth}z_j%yn3
z{6oX4-!<HIRm0s^G_3wb!<s1#_gvOc_mhTuf7GycQp39MHAKJFaNjo?>Mv<%_)5e2
zFE!l%g@z3mHEjG`!vmjb*z~D}%@;I0_=$#xKGv}1yoRmkG;I4o!}j+z?08pWPAIQc
zn2T=Q9Fl9KN>a)|DFdYplrm7tKq&*I4E%31aJ+oHB9C|9JE|0w_{Ym5^NRbmf&OTb
z{bDREZum}=lkY!?f#2Fv5BqHm{0f(PrkFRB)Tzb%%({*A2A&W|9b9aWU-44>_!I_K
zIp(Z<xtgs$HL%i>y4E)g#;quv6BP56s#^*$pTh9fmqOELdkE{uU>@+(-sQWcpkRkp
zF3ya*iS5r)f#;Kb*q*IU?LwaF)L`A&&%FB~jcxgc9%VjQk3P+Ou-<)v`C6X8jPnNb
z!8%x3&5yP=?%T6dS?wKdJ7diUI${<UdJi}5idmhFP4Sq8^&*~-Sh3w!OGo3rn6<mP
zLs`4xZB31FtF5JFf2>mseFY+ytFzUZvz4&Lm1$8G$|DtuTwgs~;HV^4Dw;nsU?&bD
z+Bpw1(#j6nX%$T!$tDK+l5PWS5fgSoMSHVD(M%$r@pwDuF^AK+eBWTUsAHv6G@Y?}
za*2Vol}Vwc^i<SN4@;qox&F6OgN}3-K<5G^vVR4=b?E8nH@KZvB1bi}EJs=2g7sXl
zy5|jOCv~hW_d4XTtS-ct_krL=)RD*>#b3^&)}xL>NPO8Bf?`i&kVs#U&H!i&%l*sy
zMQ}4Yp~(2+CwU<KRXp<&|3ZS;z$9mspufi|)x<jSm-m&RoZE>#r&GFWFSe$A@#VcH
zSk0CaU*ZTpf_gf`lfJzF1m*sN`IiawV1wo){=xH9%CBD}Z^F?M_WR5GRPaRLh9&>v
zPiFySLTk_!Sy+s8rs5Y-3+In59AOt5ntWq)E(>@`d|7{THb*{wImL<p$WLNBa69gp
T@@)L3N%~J4Wz2)ZZ_xiQ;17|*

literal 0
HcmV?d00001

diff --git a/linux-user/riscv/vdso.S b/linux-user/riscv/vdso.S
new file mode 100644
index 0000000000..31913e72cc
--- /dev/null
+++ b/linux-user/riscv/vdso.S
@@ -0,0 +1,207 @@
+/*
+ * RISC-V linux replacement vdso.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <asm/unistd.h>
+#include <asm/errno.h>
+
+.macro syscall nr
+	li	a7, \nr
+	ecall
+.endm
+
+	.text
+	.balign	16
+__vdso_gettimeofday:
+	.cfi_startproc
+#ifdef __NR_gettimeofday
+	syscall __NR_gettimeofday
+	ret
+#else
+	/* No gettimeofday, fall back to clock_gettime64. */
+	beq	a1, zero, 1f
+	sw	zero, 0(a1)	/* tz->tz_minuteswest = 0 */
+	sw	zero, 4(a1)	/* tz->tz_dsttime = 0 */
+1:	addi	sp, sp, -32
+	.cfi_adjust_cfa_offset 32
+	sw	a0, 16(sp)	/* save tv */
+	mv	a0, sp
+	syscall __NR_clock_gettime64
+	lw	t0, 0(sp)	/* timespec.tv_sec.low */
+	lw	t1, 4(sp)	/* timespec.tv_sec.high */
+	lw	t2, 8(sp)	/* timespec.tv_nsec.low */
+	lw	a1, 16(sp)	/* restore tv */
+	addi	sp, sp, 32
+	.cfi_adjust_cfa_offset -32
+	bne	a0, zero, 9f	/* syscall error? */
+	li	a0, -EOVERFLOW
+	bne	t1, zero, 9f	/* y2038? */
+	li	a0, 0
+	li	t3, 1000
+	divu	t2, t2, t3	/* nsec -> usec */
+	sw	t0, 0(a1)	/* tz->tv_sec */
+	sw	t2, 4(a1)	/* tz->tv_usec */
+9:	ret
+#endif
+	.cfi_endproc
+
+	.globl	__vdso_gettimeofday
+	.type	__vdso_gettimeofday, %function
+	.size	__vdso_gettimeofday, . - __vdso_gettimeofday
+
+	.balign	16
+__vdso_clock_gettime:
+	.cfi_startproc
+#ifdef __NR_clock_gettime
+	syscall __NR_clock_gettime
+#else
+	syscall __NR_clock_gettime64
+#endif
+	ret
+	.cfi_endproc
+
+	.globl	__vdso_clock_gettime
+	.type	__vdso_clock_gettime, %function
+	.size	__vdso_clock_gettime, . - __vdso_clock_gettime
+
+	.balign	16
+__vdso_clock_getres:
+	.cfi_startproc
+#ifdef __NR_clock_getres
+	syscall __NR_clock_getres
+#else
+	syscall __NR_clock_getres_time64
+#endif
+	ret
+	.cfi_endproc
+
+	.globl	__vdso_clock_getres
+	.type	__vdso_clock_getres, %function
+	.size	__vdso_clock_getres, . - __vdso_clock_getres
+
+	.balign	16
+__vdso_getcpu:
+	.cfi_startproc
+	syscall __NR_getcpu
+	ret
+	.cfi_endproc
+
+	.globl	__vdso_getcpu
+	.type	__vdso_getcpu, %function
+	.size	__vdso_getcpu, . - __vdso_getcpu
+
+	.balign	16
+__vdso_flush_icache:
+	.cfi_startproc
+	/* qemu does not need to flush the icache */
+	li	a0, 0
+	ret
+	.cfi_endproc
+
+	.globl	__vdso_flush_icache
+	.type	__vdso_flush_icache, %function
+	.size	__vdso_flush_icache, . - __vdso_flush_icache
+
+/*
+ * Start the unwind info at least one instruction before the signal
+ * trampoline, because the unwinder will assume we are returning
+ * after a call site.
+ */
+
+	.cfi_startproc simple
+	.cfi_signal_frame
+
+#if __riscv_xlen == 32
+# define offsetof_uc_mcontext	0x120
+#else
+# define offsetof_uc_mcontext	0x130
+#endif
+#define sizeof_reg		(__riscv_xlen / 4)
+#define sizeof_freg		8
+#define offsetof_freg0		(sizeof_reg * 32)
+
+	.cfi_def_cfa	2, offsetof_uc_mcontext
+
+	/* Return address */
+	.cfi_return_column 64
+	.cfi_offset	64, 0			/* pc */
+
+	/* Integer registers */
+	.cfi_offset	1, 1 * sizeof_reg	/* r1 (ra) */
+	.cfi_offset	2, 2 * sizeof_reg	/* r2 (sp) */
+	.cfi_offset	3, 3 * sizeof_reg
+	.cfi_offset	4, 4 * sizeof_reg
+	.cfi_offset	5, 5 * sizeof_reg
+	.cfi_offset	6, 6 * sizeof_reg
+	.cfi_offset	7, 7 * sizeof_reg
+	.cfi_offset	8, sizeof_reg * 8
+	.cfi_offset	9, 9 * sizeof_reg
+	.cfi_offset	10, 10 * sizeof_reg
+	.cfi_offset	11, 11 * sizeof_reg
+	.cfi_offset	12, 12 * sizeof_reg
+	.cfi_offset	13, 13 * sizeof_reg
+	.cfi_offset	14, 14 * sizeof_reg
+	.cfi_offset	15, 15 * sizeof_reg
+	.cfi_offset	16, 16 * sizeof_reg
+	.cfi_offset	17, 17 * sizeof_reg
+	.cfi_offset	18, 18 * sizeof_reg
+	.cfi_offset	19, 19 * sizeof_reg
+	.cfi_offset	20, 20 * sizeof_reg
+	.cfi_offset	21, 21 * sizeof_reg
+	.cfi_offset	22, 22 * sizeof_reg
+	.cfi_offset	23, 23 * sizeof_reg
+	.cfi_offset	24, 24 * sizeof_reg
+	.cfi_offset	25, 25 * sizeof_reg
+	.cfi_offset	26, 26 * sizeof_reg
+	.cfi_offset	27, 27 * sizeof_reg
+	.cfi_offset	28, 28 * sizeof_reg
+	.cfi_offset	29, 29 * sizeof_reg
+	.cfi_offset	30, 30 * sizeof_reg
+	.cfi_offset	31, 31 * sizeof_reg	/* r31 */
+
+	.cfi_offset	32, offsetof_freg0			/* f0 */
+	.cfi_offset	33, offsetof_freg0 + 1 * sizeof_freg	/* f1 */
+	.cfi_offset	34, offsetof_freg0 + 2 * sizeof_freg
+	.cfi_offset	35, offsetof_freg0 + 3 * sizeof_freg
+	.cfi_offset	36, offsetof_freg0 + 4 * sizeof_freg
+	.cfi_offset	37, offsetof_freg0 + 5 * sizeof_freg
+	.cfi_offset	38, offsetof_freg0 + 6 * sizeof_freg
+	.cfi_offset	39, offsetof_freg0 + 7 * sizeof_freg
+	.cfi_offset	40, offsetof_freg0 + 8 * sizeof_freg
+	.cfi_offset	41, offsetof_freg0 + 9 * sizeof_freg
+	.cfi_offset	42, offsetof_freg0 + 10 * sizeof_freg
+	.cfi_offset	43, offsetof_freg0 + 11 * sizeof_freg
+	.cfi_offset	44, offsetof_freg0 + 12 * sizeof_freg
+	.cfi_offset	45, offsetof_freg0 + 13 * sizeof_freg
+	.cfi_offset	46, offsetof_freg0 + 14 * sizeof_freg
+	.cfi_offset	47, offsetof_freg0 + 15 * sizeof_freg
+	.cfi_offset	48, offsetof_freg0 + 16 * sizeof_freg
+	.cfi_offset	49, offsetof_freg0 + 17 * sizeof_freg
+	.cfi_offset	50, offsetof_freg0 + 18 * sizeof_freg
+	.cfi_offset	51, offsetof_freg0 + 19 * sizeof_freg
+	.cfi_offset	52, offsetof_freg0 + 20 * sizeof_freg
+	.cfi_offset	53, offsetof_freg0 + 21 * sizeof_freg
+	.cfi_offset	54, offsetof_freg0 + 22 * sizeof_freg
+	.cfi_offset	55, offsetof_freg0 + 23 * sizeof_freg
+	.cfi_offset	56, offsetof_freg0 + 24 * sizeof_freg
+	.cfi_offset	57, offsetof_freg0 + 25 * sizeof_freg
+	.cfi_offset	58, offsetof_freg0 + 26 * sizeof_freg
+	.cfi_offset	59, offsetof_freg0 + 27 * sizeof_freg
+	.cfi_offset	60, offsetof_freg0 + 28 * sizeof_freg
+	.cfi_offset	61, offsetof_freg0 + 29 * sizeof_freg
+	.cfi_offset	62, offsetof_freg0 + 30 * sizeof_freg
+	.cfi_offset	63, offsetof_freg0 + 31 * sizeof_freg	/* f31 */
+
+	nop
+
+__vdso_rt_sigreturn:
+	syscall	__NR_rt_sigreturn
+	.cfi_endproc
+
+	.globl	__vdso_rt_sigreturn
+	.type	__vdso_rt_sigreturn, %function
+	.size	__vdso_rt_sigreturn, . - __vdso_rt_sigreturn
diff --git a/linux-user/riscv/vdso.ld b/linux-user/riscv/vdso.ld
new file mode 100644
index 0000000000..57f3159415
--- /dev/null
+++ b/linux-user/riscv/vdso.ld
@@ -0,0 +1,76 @@
+/*
+ * Linker script for linux riscv replacement vdso.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+VERSION {
+        LINUX_4.15 {
+        global:
+                __vdso_rt_sigreturn;
+                __vdso_gettimeofday;
+                __vdso_clock_gettime;
+                __vdso_clock_getres;
+                __vdso_getcpu;
+                __vdso_flush_icache;
+
+        local: *;
+        };
+}
+
+
+PHDRS {
+        phdr            PT_PHDR         FLAGS(4) PHDRS;
+        data            PT_LOAD         FLAGS(6) FILEHDR PHDRS;
+        text            PT_LOAD         FLAGS(5);
+        dynamic         PT_DYNAMIC      FLAGS(4);
+        eh_frame_hdr    PT_GNU_EH_FRAME;
+        note            PT_NOTE         FLAGS(4);
+}
+
+SECTIONS {
+        /*
+         * We can't prelink to any address without knowing something about
+         * the virtual memory space of the host, since that leaks over into
+         * the available memory space of the guest.
+         */
+        . = SIZEOF_HEADERS;
+
+        /*
+         * The following, including the FILEHDRS and PHDRS, are modified
+         * when we relocate the binary.  We want them to be initially
+         * writable for the relocation; we'll force them read-only after.
+         */
+        .note           : { *(.note*) }         :data :note
+        .dynamic        : { *(.dynamic) }       :data :dynamic
+        .dynsym         : { *(.dynsym) }        :data
+        /*
+         * There ought not be any real read-write data.
+         * But since we manipulated the segment layout,
+         * we have to put these sections somewhere.
+         */
+        .data           : {
+                *(.data*)
+                *(.sdata*)
+                *(.got.plt) *(.got)
+                *(.gnu.linkonce.d.*)
+                *(.bss*)
+                *(.dynbss*)
+                *(.gnu.linkonce.b.*)
+        }
+
+        .rodata         : { *(.rodata*) }
+        .hash           : { *(.hash) }
+        .gnu.hash       : { *(.gnu.hash) }
+        .dynstr         : { *(.dynstr) }
+        .gnu.version    : { *(.gnu.version) }
+        .gnu.version_d  : { *(.gnu.version_d) }
+        .gnu.version_r  : { *(.gnu.version_r) }
+        .eh_frame_hdr   : { *(.eh_frame_hdr) }  :data :eh_frame_hdr
+        .eh_frame       : { *(.eh_frame) }      :data
+
+        . = ALIGN(4096);
+        .text           : { *(.text*) }         :text   =0xd503201f
+}
-- 
2.25.1


