Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jaNaZ-0006OE-U3
	for mharc-qemu-riscv@gnu.org; Sun, 17 May 2020 14:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jaNaY-0006L0-0q
 for qemu-riscv@nongnu.org; Sun, 17 May 2020 14:00:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22296
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jaNaV-00065J-V8
 for qemu-riscv@nongnu.org; Sun, 17 May 2020 14:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589738433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=fLpKO8sZ/hqI9BOhCP2moj/9si8EyxyqgTEpAoV6SQ0=;
 b=exZ2Vrm9HI8Wi3tv5E62Wsca43fXzXINop13Bq1JSZRCRmtlnw6qiix/FmQ1pwQWK9Miue
 3S8+mxbAHNGgdC2jUIC71FwmnVsgL7eeBmaLwvPngGlR6r8hPqe9GaPiE8+q8BWscmA7VB
 d43dx4yMOktdB0Plu9c6Lp9jmC4QKQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-gqQGG_ssOUKA9tW4Zb9CzQ-1; Sun, 17 May 2020 14:00:30 -0400
X-MC-Unique: gqQGG_ssOUKA9tW4Zb9CzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2358C460;
 Sun, 17 May 2020 18:00:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-98.ams2.redhat.com [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BFE85D9D7;
 Sun, 17 May 2020 18:00:19 +0000 (UTC)
Subject: Re: [PATCH v2 05/10] Makefile: Remove dangerous EOL trailing backslash
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-6-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d1eea504-4e09-55a4-53be-20f812f5b272@redhat.com>
Date: Sun, 17 May 2020 20:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-6-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 13:26:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 17 May 2020 18:00:38 -0000

On 15/05/2020 19.07, Philippe Mathieu-Daudé wrote:
> One might get caught trying to understand unexpected Makefile
> behavior. Trailing backslash can help to split very long lines,
> but are rather dangerous when nothing follow. Preserve other
> developers debugging time by removing this one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 34275f57c9..84453789f9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -420,7 +420,7 @@ MINIKCONF_ARGS = \
>  
>  MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
>  MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
> -MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py \
> +MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
>  
>  $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
>  	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


