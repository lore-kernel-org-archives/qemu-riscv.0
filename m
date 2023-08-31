Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB43C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhOF-0001HO-RH; Thu, 31 Aug 2023 09:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qbhO9-0001F7-Aj; Thu, 31 Aug 2023 09:07:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qbhO5-00005s-LP; Thu, 31 Aug 2023 09:07:09 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9D4461E3BC;
 Thu, 31 Aug 2023 16:07:27 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7D3D424D23;
 Thu, 31 Aug 2023 16:06:53 +0300 (MSK)
Message-ID: <cc0e09e8-8ffc-741f-1ac9-5cebe312b684@tls.msk.ru>
Date: Thu, 31 Aug 2023 16:06:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PULL 39/41] meson: Fix MESONINTROSPECT parsing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20230831125646.67855-1-philmd@linaro.org>
 <20230831125646.67855-40-philmd@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230831125646.67855-40-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -103
X-Spam_score: -10.4
X-Spam_bar: ----------
X-Spam_report: (-10.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.478,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

31.08.2023 15:56, Philippe Mathieu-Daudé wrote:
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> The arguments in MESONINTROSPECT are quoted with shlex.quote() so it
> must be parsed with shlex.split().
> 
> Fixes: cf60ccc330 ("cutils: Introduce bundle mechanism")
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
> Tested-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-ID: <20230812061540.5398-1-akihiko.odaki@daynix.com>
> ---
>   scripts/symlink-install-tree.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
> index 8ed97e3c94..b72563895c 100644
> --- a/scripts/symlink-install-tree.py
> +++ b/scripts/symlink-install-tree.py
> @@ -4,6 +4,7 @@
>   import errno
>   import json
>   import os
> +import shlex
>   import subprocess
>   import sys
>   
> @@ -14,7 +15,7 @@ def destdir_join(d1: str, d2: str) -> str:
>       return str(PurePath(d1, *PurePath(d2).parts[1:]))
>   
>   introspect = os.environ.get('MESONINTROSPECT')
> -out = subprocess.run([*introspect.split(' '), '--installed'],
> +out = subprocess.run([*shlex.split(introspect), '--installed'],
>                        stdout=subprocess.PIPE, check=True).stdout

This turned out to be wrong on windows.

/mjt

