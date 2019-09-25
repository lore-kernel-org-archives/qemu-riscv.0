Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDGkz-0005aU-4D
	for mharc-qemu-riscv@gnu.org; Wed, 25 Sep 2019 19:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iDGku-0005Ws-4Y
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 19:31:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iDGkp-0002ur-Oh
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 19:31:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43496)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iDGko-0002rV-K1
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 19:31:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id q17so240982wrx.10
 for <qemu-riscv@nongnu.org>; Wed, 25 Sep 2019 16:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jSCFOhECRftmmvA+lheNZeXhhJgeT4gP4yCV2T0qHzQ=;
 b=ZNPbvppH91Y+CfZxkum0TG+w1r5IKnBH+RVVhl1vo/EwaQ8UEubuIZBmEVXfEhMXwp
 Lp6gEOUjWwUWNFrD9Jn47LZ3MP3Ug1fswk0pgS8UoScsIGuCcUwjL0POpkzxc/XE5uL5
 D2xmv8ipN8lyKe/gv+mlCDKcmrsApUuiaz2WgUH8t6hBdTRnrW6XpoyErLLRl3zp3ZbN
 mg6+gJNSPOsuh9Xfv601Bmoduv6UHYNbKS5p2PvKGba8AIybHhClwblg214fXQyODn0T
 DA4jEcu5Uq7LZK1NHo51s5SXyQlB7Zg/LYRV8SP8h39siQ3bKF8m4SGnL84vS7Vf13H9
 KQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jSCFOhECRftmmvA+lheNZeXhhJgeT4gP4yCV2T0qHzQ=;
 b=qdeonv7E2AlxjklvhfZwlngXTa0/GTOlMIFy9FDJl6zN46nR+BtJXwzd4lN9YUPK5X
 G2ofonz9QWv2V8KsKXdbhEoAf4ISkz16cXQwpCG4DzAVry5XA4nYTJ6YcTvQJuR1tHMe
 ySU0L0ySqqBjJytOZVJu+sLUf613LScfgLbDE8c7Mr54he4rpcQznzPHG2pu/hr6hikI
 W6Kbn5dK79sJFg0HdrfMa/qfceHLa0AAM0NXo0QwAyYMzNjSE9ZHbw2py2EIImq04V19
 b8yMblB96o6Lr1eXUaBF8IlbkvoCy8mwrfmuVkVNl2kyKYoP7zOst9ISfocAgM4Ap/vX
 HXBA==
X-Gm-Message-State: APjAAAUxhb+3YShVfHnO8PvwUffvfhq9htfn1swhgcC6NrJxzq9GQcZE
 aoeswoIe0QOTcbHV555V0Q7C0Q==
X-Google-Smtp-Source: APXvYqxnBt1VFE+UIodNnJhN6MZLorcAkOoP9wvzAiN7iSdwTxye8EoiTX/N2btEZNoEpGACr3tQLA==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr515758wrm.238.1569454223405;
 Wed, 25 Sep 2019 16:30:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v8sm399828wra.79.2019.09.25.16.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 16:30:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12F441FF87;
 Thu, 26 Sep 2019 00:30:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnnu.org, qemu-riscv@nongnu.org,
 qemu-discuss@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH] configure: deprecate 32 bit build hosts
Date: Thu, 26 Sep 2019 00:30:13 +0100
Message-Id: <20190925233013.6449-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
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
X-List-Received-Date: Wed, 25 Sep 2019 23:31:35 -0000

The 32 bit hosts are already a second class citizen especially with
support for running 64 bit guests under TCG. We are also limited by
testing as actual working 32 bit machines are getting quite rare in
developers personal menageries. For TCG supporting newer types like
Int128 is a lot harder with 32 bit calling conventions compared to
their larger bit sized cousins. Fundamentally address space is the
most useful thing for the translator to have even for a 32 bit guest a
32 bit host is quite constrained.

As far as I'm aware 32 bit KVM users are even less numerous. Even
ILP32 doesn't make much sense given the address space QEMU needs to
manage.

Lets mark these machines as deprecated so we can have the wailing and
gnashing of teeth now and look to actually dropping the support in a
couple of cycles.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 542f6aea3f..776fd460b5 100755
--- a/configure
+++ b/configure
@@ -728,7 +728,7 @@ ARCH=
 # Normalise host CPU name and set ARCH.
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
+  ppc64|s390|s390x|sparc64|riscv64)
     supported_cpu="yes"
   ;;
   ppc64le)
@@ -737,7 +737,6 @@ case "$cpu" in
   ;;
   i386|i486|i586|i686|i86pc|BePC)
     cpu="i386"
-    supported_cpu="yes"
   ;;
   x86_64|amd64)
     cpu="x86_64"
@@ -745,19 +744,22 @@ case "$cpu" in
   ;;
   armv*b|armv*l|arm)
     cpu="arm"
-    supported_cpu="yes"
   ;;
   aarch64)
     cpu="aarch64"
     supported_cpu="yes"
   ;;
-  mips*)
+  mips64*)
     cpu="mips"
     supported_cpu="yes"
   ;;
+  mips*)
+    cpu="mips"
+  ;;
   sparc|sun4[cdmuv])
     cpu="sparc"
-    supported_cpu="yes"
+  ;;
+  x32|riscv32)
   ;;
   *)
     # This will result in either an error or falling back to TCI later
@@ -6438,12 +6440,12 @@ if test "$supported_cpu" = "no"; then
     echo "WARNING: SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!"
     echo
     echo "CPU host architecture $cpu support is not currently maintained."
-    echo "The QEMU project intends to remove support for this host CPU in"
-    echo "a future release if nobody volunteers to maintain it and to"
-    echo "provide a build host for our continuous integration setup."
-    echo "configure has succeeded and you can continue to build, but"
-    echo "if you care about QEMU on this platform you should contact"
-    echo "us upstream at qemu-devel@nongnu.org."
+    echo "The QEMU project intends to remove support for all 32 bit host"
+    echo "CPUs in a future release. 64 bit hosts will need a volunteer"
+    echo "to maintain it and to provide a build host for our continuous"
+    echo "integration setup. configure has succeeded and you can continue"
+    echo "to build, but if you care about QEMU on this platform you"
+    echo "should contact us upstream at qemu-devel@nongnu.org."
 fi
 
 if test "$supported_os" = "no"; then
-- 
2.20.1


