Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hw71t-0000tY-Dq
	for mharc-qemu-riscv@gnu.org; Fri, 09 Aug 2019 11:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50821)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71p-0000f5-Ei
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:42:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71n-0008VC-NA
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:42:05 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33414)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hw71l-0008R2-M1
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:42:03 -0400
Received: by mail-pl1-x641.google.com with SMTP id c14so45030045plo.0
 for <qemu-riscv@nongnu.org>; Fri, 09 Aug 2019 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=leHpSxHzVUfQCq35SXdIhrfSJv5bGUxlfMEN59fKGs8=;
 b=R+x9JWNGRCUyPT9qY3gVRkx/94Jp2YtcuNACFzBuhhxhqF95so80+Jb8LzC7mqvsLE
 PC1JIijvAdAWGOxKse6YwXT0dF8oVgKkcY4NyvZYiY9uV7qkFrkRJh6qZcs7DHqC/Hrw
 DZohBIcvGacA/E0rBf7QTEmwaq9UQlQEF7IYM/eUVmlgtqPtgnV2gPIu+UZsGPtIQ3HT
 +iZ27v7taX0V46y2bXnJWuseXxxFPGoozjGC3faiJmbLMWbH9eGtJ6tMM1X2qCp2ii7x
 +AWyzWzDTHpxRPIEDUXvlKn5rPoOeMXZeDR332BiSIOBsgiC2Y4k3d862xbmCtgufaJk
 clnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=leHpSxHzVUfQCq35SXdIhrfSJv5bGUxlfMEN59fKGs8=;
 b=GaGoHSVDE8UMyhB+zs3QbAfRmykN58yVvREbTpYaBvtIN3OKFwPNIxMAytI3j8WgGZ
 PqXI/Hsi7zpt4EUzo6tOUM23bJZI3YweZrMJWb7eQ3dF0jfm9r6/qHhbsDJBhnAILHEL
 tAa+Z9Ai4uaMYU65es83JfF/8R6Use43rmAzAHbcQLVdAbCCo4Xhlv9HSt7Bm7cu9nwM
 +r+Ex6I2d5S85zfQWdDnxs7RXgdUGV+yt6hPudxuId++0cv2lLli4bPrjBc/NK/jbOVV
 IKkoyTnzAMkZ/Elhzr78vDjspZsBPDR4TaqlpA99ODz3cwhG4eDrrJSX0y6QL/FMeblV
 NwJA==
X-Gm-Message-State: APjAAAXyJiiAfNsYHynW32wQV84iW9d0Bx+4vZaXb25e+7HTnbrblLHN
 KcVqN4N/JoNnVWR1dRTJ4IY+zA==
X-Google-Smtp-Source: APXvYqz1hWfeknIiwUhlO6H8PJ7tvLD522TuqQjZPZ6xJ7ttkaVOB/zgqj9VJzjJKHTm+8JMBJDKxA==
X-Received: by 2002:a17:902:7d86:: with SMTP id
 a6mr19609862plm.199.1565365318747; 
 Fri, 09 Aug 2019 08:41:58 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 67sm80452179pfd.177.2019.08.09.08.41.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:41:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, Alistair.Francis@wdc.com
Date: Fri,  9 Aug 2019 08:41:52 -0700
Message-Id: <20190809154153.31763-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809154153.31763-1-richard.henderson@linaro.org>
References: <20190809154153.31763-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-riscv] [PATCH 2/3] decodetree: Suppress redundant declaration
 warnings
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
X-List-Received-Date: Fri, 09 Aug 2019 15:42:07 -0000

We can tell that a decodetree input file is "secondary" when it
uses an argument set marked "!extern".  This indicates that at
least one of the insn translation functions will have already
been declared by the "primary" input file, but given only the
secondary we cannot tell which.

Avoid redundant declaration warnings by suppressing them with pragmas.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index a2490aeb74..f02c8acca1 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -33,6 +33,7 @@ arguments = {}
 formats = {}
 patterns = []
 allpatterns = []
+anyextern = False
 
 translate_prefix = 'trans'
 translate_scope = 'static '
@@ -485,12 +486,14 @@ def parse_arguments(lineno, name, toks):
     """Parse one argument set from TOKS at LINENO"""
     global arguments
     global re_ident
+    global anyextern
 
     flds = []
     extern = False
     for t in toks:
         if re_fullmatch('!extern', t):
             extern = True
+            anyextern = True
             continue
         if not re_fullmatch(re_ident, t):
             error(lineno, 'invalid argument set token "{0}"'.format(t))
@@ -1191,6 +1194,7 @@ def main():
     global insnmask
     global decode_function
     global variablewidth
+    global anyextern
 
     decode_scope = 'static '
 
@@ -1251,6 +1255,19 @@ def main():
     # A single translate function can be invoked for different patterns.
     # Make sure that the argument sets are the same, and declare the
     # function only once.
+    #
+    # If we're sharing formats, we're likely also sharing trans_* functions,
+    # but we can't tell which ones.  Prevent issues from the compiler by
+    # suppressing redundant declaration warnings.
+    if anyextern:
+        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
+               "# pragma GCC diagnostic push\n",
+               "# pragma GCC diagnostic ignored \"-Wredundant-decls\"\n",
+               "# ifdef __clang__\n"
+               "#  pragma GCC diagnostic ignored \"-Wtypedef-redefinition\"\n",
+               "# endif\n",
+               "#endif\n\n")
+
     out_pats = {}
     for i in allpatterns:
         if i.name in out_pats:
@@ -1262,6 +1279,11 @@ def main():
             out_pats[i.name] = i
     output('\n')
 
+    if anyextern:
+        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
+               "# pragma GCC diagnostic pop\n",
+               "#endif\n\n")
+
     for n in sorted(formats.keys()):
         f = formats[n]
         f.output_extract()
-- 
2.17.1


