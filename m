Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBD5CA5FC4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 07:49:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCY0l-0003v3-PP; Fri, 02 Oct 2026 03:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCY0i-0003uj-5W
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 03:48:53 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dingtaodtdt@gmail.com>)
 id 1xCY0g-0003t6-JR
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 03:48:51 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 98e67ed59e1d1-39dacf053eeso3841408a91.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790927329; x=1791532129; darn=nongnu.org;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:content-type:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ZfPdg4X3nsFjeE/mDg76P8zumypw4P9E11GjXkN/2uY=;
 b=GAAFxQI3e2yO67OITmSoy13B5nneZToMpbXrX0+InArxnA7mQXHlA8eMtMrSTXYLaa
 DrIcgcGL9g38DxIdvFH+jsFvizrmFHs4pR61cGMP0rzuuehvYRZohvzRltz5xjWIuDG5
 uwU/h+tTszR5eul9xvkEfX6Qey5CC8Bys99dvnpmUY4Sp5Quamm+yOXtKvdlbMVzZM4e
 7qjQqEZT5AnRubeFufn8NsXghwJPSqVVpSqmrxf5v8M3rgAR9mCifsk3M68zMzGe37I2
 eDj/K1O96LZP97DlzzteIIu062JLz9UYgblLChHSrNhddCQSUi6emzWfBS8/wUsccXdG
 pxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790927329; x=1791532129;
 h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
 :date:message-id:content-type:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ZfPdg4X3nsFjeE/mDg76P8zumypw4P9E11GjXkN/2uY=;
 b=no+qM4bTFERPhTGTMJNXWFeQ7Q25znjJ4H/AZkx7qm3Dm2PapJSOK4RK16n6a3ZlgV
 OqCeX9605AEyfdkMwrX+k/2rZ7Y1uGrl138vs9t0NtseEUXQmAwgMtx52xVYcoZO1r2g
 YgXLITCD+2PgfabXCgoAhH4GCNZ7q4iyd2nF0LRVIA9wgn6ezPGbac2HMDaK815oSSUJ
 6F6ETXWc5zAMb6ED0CPkVinr9WB8ByNif8yylJgx3NBrMywNSQkm7Cu0yB0IAapcMKwM
 ArLW9kEx6A11jtwqpXYt3al5jlgPcOCHj3FMjZpArySbdYCfPubmrSmOD6eUCqxclctN
 /TVw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6u5kCXzCH50cOa8cU2JZCGiLPDJn3H+rhSy7wds7ACuI55msd9WIKz9ocXjhil4f5q6P570Bkudfs@nongnu.org
X-Gm-Message-State: AFq9FYIq+KpYkjKZjVK1iF3qsH/CUDizSkaVlIuMSQJU6lQzOOvvGOfF
 unj7k0QWiLTKicM+77j1jls2XAgu2QLcJaMVXh61bD4XtYBy6X4GTmfnqmFJD3Wf
X-Gm-Gg: AYBFou17PAYaoJGQP0ixQU9nbsOCoJ8LHRL7TwLPFhQamOTOS/NooDhfHDT22jhFwUF
 g+IKVZ0/5RB3wJR4+ySOH+vf5s7FcfI7UJrc0Z2RXaCyoZoqkLV4Vf5ekbcrIcgxst3JVqMnDBH
 B7/T8lYA0h/ted3vzEn+pG4PR2jw4mGKISvL1kjtIOwiZdB0/NIXLMAVRC95gv+/1S74nrVwn1Y
 q/KwEvEWKtS/ktIukSlo+NIkDbb3gb9FTCjpfZu9+lKNPI2fjgSU7mlJJjlSn3sAv7/jfAYx5lm
 Zl/DjwgINRgAEx88wLeB+le+2sr74PLjBchQ48dP78KlTy7vXwQeEeBslvQBkK+FbKXMUzM/7+w
 krThncRUpJkEVU0fJV8yci1ZW4dJrG7cxFKUnUTJhC76Hc361Z14SEnteBelI9XpfcFlMgeIb5G
 RZSL/e4XywJdj5pvOL3+ck9EYu/J7knytvR5ryyLm7H6zwn7MMfYlm4VvQ/k5Xvlx+ndlotnWA/
 IOu6QSXLRUKyW4=
X-Received: by 2002:a17:90b:3809:b0:3a6:fe14:4790 with SMTP id
 98e67ed59e1d1-3a6fe144812mr11964a91.28.1790927328958; 
 Fri, 02 Oct 2026 00:48:48 -0700 (PDT)
Received: from [192.168.3.23] ([175.152.37.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a6dd3962f0sm865085a91.3.2026.10.02.00.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 00:48:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------DTA1OiDyLbSWjkcFQDh3fJul"
Message-ID: <50ab5588-97bd-4f6c-9f69-042dcc6363a6@gmail.com>
Date: Fri, 2 Oct 2026 15:48:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] qtest: fix k230_decomp_gzip test integer handling
 issues
To: Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "dingtao0430@163.com" <dingtao0430@163.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "farosas@suse.de" <farosas@suse.de>,
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>
References: <20261001022223.8633-1-dingtao0430@163.com>
 <20261001022223.8633-3-dingtao0430@163.com>
 <f75dc58c63d02fac89f3b4940ade9fe54d41ec15.camel@wdc.com>
From: Tao Ding <dingtaodtdt@gmail.com>
In-Reply-To: <f75dc58c63d02fac89f3b4940ade9fe54d41ec15.camel@wdc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=dingtaodtdt@gmail.com; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This is a multi-part message in MIME format.
--------------DTA1OiDyLbSWjkcFQDh3fJul
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/2/2026 7:28 AM, Alistair Francis wrote:
> On Thu, 2026-10-01 at 10:22 +0800, Tao Ding wrote:
>> Cast slot to hwaddr before multiplication to prevent 32-bit overflow
>> when
>> calculating the SRAM input address.
>>
>> Resolves: Coverity CID 1685514
>>
>> Reported-by: Alistair Francis<Alistair.Francis@wdc.com>
>> Signed-off-by: Tao Ding<dingtao0430@163.com>
>> ---
>>   tests/qtest/k230-decomp-gzip-test.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/k230-decomp-gzip-test.c b/tests/qtest/k230-
>> decomp-gzip-test.c
>> index e80113fd28..249c8ae82c 100644
>> --- a/tests/qtest/k230-decomp-gzip-test.c
>> +++ b/tests/qtest/k230-decomp-gzip-test.c
>> @@ -46,7 +46,7 @@ static inline hwaddr k230_sram_addr(hwaddr off)
>>   static inline hwaddr k230_sram_input_addr(unsigned int slot)
>>   {
>>       return k230_sram_addr(K230_DECOMP_GZIP_SRAM_IN_BASE +
>> -                          slot * K230_DECOMP_GZIP_BLOCK_SIZE);
>> +                          (hwaddr) slot *
>> K230_DECOMP_GZIP_BLOCK_SIZE);
> What is the point of this function? It's only ever passed 0

The hardware has two input SRAM slots (|K230_DECOMP_GZIP_INPUT_SLOTS| is 2).
This helper is intended to calculate the address for either slot.
The current test only uses slot 0 because its input in a single block.

> Alistair
>
>>   }
>>   
>>   /*
--------------DTA1OiDyLbSWjkcFQDh3fJul
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/2/2026 7:28 AM, Alistair Francis
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f75dc58c63d02fac89f3b4940ade9fe54d41ec15.camel@wdc.com">
      <pre wrap="" class="moz-quote-pre">On Thu, 2026-10-01 at 10:22 +0800, Tao Ding wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Cast slot to hwaddr before multiplication to prevent 32-bit overflow
when 
calculating the SRAM input address. 

Resolves: Coverity CID 1685514

Reported-by: Alistair Francis <a class="moz-txt-link-rfc2396E" href="mailto:Alistair.Francis@wdc.com">&lt;Alistair.Francis@wdc.com&gt;</a>
Signed-off-by: Tao Ding <a class="moz-txt-link-rfc2396E" href="mailto:dingtao0430@163.com">&lt;dingtao0430@163.com&gt;</a>
---
 tests/qtest/k230-decomp-gzip-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/k230-decomp-gzip-test.c b/tests/qtest/k230-
decomp-gzip-test.c
index e80113fd28..249c8ae82c 100644
--- a/tests/qtest/k230-decomp-gzip-test.c
+++ b/tests/qtest/k230-decomp-gzip-test.c
@@ -46,7 +46,7 @@ static inline hwaddr k230_sram_addr(hwaddr off)
 static inline hwaddr k230_sram_input_addr(unsigned int slot)
 {
     return k230_sram_addr(K230_DECOMP_GZIP_SRAM_IN_BASE +
-                          slot * K230_DECOMP_GZIP_BLOCK_SIZE);
+                          (hwaddr) slot *
K230_DECOMP_GZIP_BLOCK_SIZE);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What is the point of this function? It's only ever passed 0
</pre>
    </blockquote>
    <pre>The hardware has two input SRAM slots (<code dir="ltr">K230_DECOMP_GZIP_INPUT_SLOTS</code> is 2). 
This helper is intended to calculate the address for either slot. 
The current test only uses slot 0 because its input in a single block.</pre>
    <blockquote type="cite"
      cite="mid:f75dc58c63d02fac89f3b4940ade9fe54d41ec15.camel@wdc.com">
      <pre wrap="" class="moz-quote-pre">
Alistair

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> }
 
 /*
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------DTA1OiDyLbSWjkcFQDh3fJul--

