Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hw789-00075j-Rp
	for mharc-qemu-riscv@gnu.org; Fri, 09 Aug 2019 11:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52207)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hw786-00074t-M9
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:48:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hw785-0004sm-Hf
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:48:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hw785-0004sC-Aw
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 11:48:33 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so6201229wms.2
 for <qemu-riscv@nongnu.org>; Fri, 09 Aug 2019 08:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YJrmoykIBEWAFplSajUyfYNmvAFn9Dx6xYH3F/xZC4M=;
 b=cnWzV9XeL8pJFHpZo7wqp62RPF6hKRkIyCgVfJgrTyaA78QYym9FsrLiEGuFstTWhr
 paMD44D5xxrPk4+vxlkofU/9PIujAUHitaC/GMN7OnLpuLEa5cv+I3R6om6Pl+nQmdYA
 88M9HfhPpmk5zb29pmdN4dDapK7ZKkeKny2gaaKWPScXhm4m0XU9IVpz6TNbXv6susL3
 jGPFdQV9qz6CqgDmTHr3PvPxVoBHI/mCbIOJtNol6DKCwAIA0n67GZ/a8PiYe/1ry0i0
 7leCLucD9/gep+SRjhfeevW0sjqCMCMivlBKrrTGwv6WUn3Onbb23iF8IcLyoyKu2htX
 UzJQ==
X-Gm-Message-State: APjAAAViBYMOYFftYVnLxcB2FBxj+GFOvz993dOysSWEF1AxfSVtTXwZ
 RcLb13Tm2LZq0jBuFCKSunTzYA==
X-Google-Smtp-Source: APXvYqwKqCqKFK8m0vpwWfVTPQnsYyNUV40M7p67yQ4H4O5IRyKfSGRkB8jz24YWFVkNyTC/uiJ5zw==
X-Received: by 2002:a1c:c584:: with SMTP id v126mr5899578wmf.27.1565365712237; 
 Fri, 09 Aug 2019 08:48:32 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id v124sm9581891wmf.23.2019.08.09.08.48.31
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 08:48:31 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 Alistair.Francis@wdc.com
References: <20190809154153.31763-1-richard.henderson@linaro.org>
 <20190809154153.31763-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <004e3b74-0a20-0dc2-e01d-decc31986eea@redhat.com>
Date: Fri, 9 Aug 2019 17:48:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190809154153.31763-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-riscv] [PATCH 2/3] decodetree: Suppress redundant
 declaration warnings
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
X-List-Received-Date: Fri, 09 Aug 2019 15:48:35 -0000

On 8/9/19 5:41 PM, Richard Henderson wrote:
> We can tell that a decodetree input file is "secondary" when it
> uses an argument set marked "!extern".  This indicates that at
> least one of the insn translation functions will have already
> been declared by the "primary" input file, but given only the
> secondary we cannot tell which.
> 
> Avoid redundant declaration warnings by suppressing them with pragmas.

That was quick, thanks!

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  scripts/decodetree.py | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index a2490aeb74..f02c8acca1 100755
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -33,6 +33,7 @@ arguments = {}
>  formats = {}
>  patterns = []
>  allpatterns = []
> +anyextern = False
>  
>  translate_prefix = 'trans'
>  translate_scope = 'static '
> @@ -485,12 +486,14 @@ def parse_arguments(lineno, name, toks):
>      """Parse one argument set from TOKS at LINENO"""
>      global arguments
>      global re_ident
> +    global anyextern
>  
>      flds = []
>      extern = False
>      for t in toks:
>          if re_fullmatch('!extern', t):
>              extern = True
> +            anyextern = True
>              continue
>          if not re_fullmatch(re_ident, t):
>              error(lineno, 'invalid argument set token "{0}"'.format(t))
> @@ -1191,6 +1194,7 @@ def main():
>      global insnmask
>      global decode_function
>      global variablewidth
> +    global anyextern
>  
>      decode_scope = 'static '
>  
> @@ -1251,6 +1255,19 @@ def main():
>      # A single translate function can be invoked for different patterns.
>      # Make sure that the argument sets are the same, and declare the
>      # function only once.
> +    #
> +    # If we're sharing formats, we're likely also sharing trans_* functions,
> +    # but we can't tell which ones.  Prevent issues from the compiler by
> +    # suppressing redundant declaration warnings.
> +    if anyextern:
> +        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
> +               "# pragma GCC diagnostic push\n",
> +               "# pragma GCC diagnostic ignored \"-Wredundant-decls\"\n",
> +               "# ifdef __clang__\n"
> +               "#  pragma GCC diagnostic ignored \"-Wtypedef-redefinition\"\n",
> +               "# endif\n",
> +               "#endif\n\n")
> +
>      out_pats = {}
>      for i in allpatterns:
>          if i.name in out_pats:
> @@ -1262,6 +1279,11 @@ def main():
>              out_pats[i.name] = i
>      output('\n')
>  
> +    if anyextern:
> +        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
> +               "# pragma GCC diagnostic pop\n",
> +               "#endif\n\n")
> +
>      for n in sorted(formats.keys()):
>          f = formats[n]
>          f.output_extract()
> 

