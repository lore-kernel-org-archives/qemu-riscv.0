Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jicBf-0008Ae-6T
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jun 2020 07:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicBb-00087q-Ea
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:12:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20444
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicBa-0002Ci-Ld
 for qemu-riscv@nongnu.org; Tue, 09 Jun 2020 07:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dy54HX3yjH25i0N8iq/ISO1rX+f/prrBggOwYYHoeGM=;
 b=HR49Uf0DQHxjx4rRQ8oGbVB4pgnsV7xF0iRe7niF8RVnObE4IFdmq+lyd9c8BvbLW5tWLv
 9f9H2KKb32PTouYy3AM6/oO9p+cFIlI9DH+99mOO8wTczRXktSa5AE5yCCo5cG6ISa4D/B
 RLRCJskwdN62AYmjBpE4zx5xjF/BKDc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-MjD9bzovNx2UxBgxJlpgWg-1; Tue, 09 Jun 2020 07:12:52 -0400
X-MC-Unique: MjD9bzovNx2UxBgxJlpgWg-1
Received: by mail-wr1-f72.google.com with SMTP id s7so8488816wrm.16
 for <qemu-riscv@nongnu.org>; Tue, 09 Jun 2020 04:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dy54HX3yjH25i0N8iq/ISO1rX+f/prrBggOwYYHoeGM=;
 b=r+yhEFCmivYJTGxZxGuqQFQvMNS8OYdKrunW3NznE49HhSiKmeRIY8KZqCU9/S1Nyc
 b607WmCzO3+GVV2uhuXW3GjmFWo6EDQZKdFWWue7Gl52dnT4LaF4jRkjUYwBVd5N1TGG
 882S7EqASktAEcSkLmtPkOdHtwvUTXDJaepPq5UseblYg/QpS1c1MwCTVAyvxQmoPmfc
 56tvaJ4AGscmAYUobzWeUmVWIbyulkiu3EVUorT4csQS+DMYVCrYXcVPjjsNufXENz5h
 eWgNKlLvNiiOOdF7XNmuslSnnR9VvoEC42RrlSWVz9awTniUQ+nQ0rWJRfHuzFyy+hwX
 HTyA==
X-Gm-Message-State: AOAM5309HUAhKdALBHnzUh5SlhM+jxwIEKc3AdC/XO34iOEor4l/RDKZ
 u2KhWYef8v95W4nXgrLN2dVHyVJHxOy8fTMiXdEWexWyWrH1wBo5wboGB3jb+HqkjJ647CXO2NA
 w8Wlri4+GyJP0c8M=
X-Received: by 2002:a5d:6944:: with SMTP id r4mr3766996wrw.169.1591701170929; 
 Tue, 09 Jun 2020 04:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1H01HZsnF0pwx9oeoL9yjnBGXgYxEXfgTncokwamlfkzpTt0NHDCpjwEqldpHwJp0uf5vaQ==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr3766967wrw.169.1591701170664; 
 Tue, 09 Jun 2020 04:12:50 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u130sm2588369wmg.32.2020.06.09.04.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:12:50 -0700 (PDT)
Subject: Re: [RFC PATCH 27/35] hw/ppc/ppc: Emit warning when old code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-28-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <135e04f9-a2f4-b4d4-6689-83ae1f36d81c@redhat.com>
Date: Tue, 9 Jun 2020 13:12:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-28-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:44:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 09 Jun 2020 11:12:56 -0000

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ppc/ppc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 4a11fb1640..39fcf746c5 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -37,6 +37,7 @@
>  #include "kvm_ppc.h"
>  #include "migration/vmstate.h"
>  #include "trace.h"
> +#include "hw/qdev-deprecated.h"
>  
>  //#define PPC_DEBUG_IRQ
>  //#define PPC_DEBUG_TB
> @@ -1114,6 +1115,8 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>      PowerPCCPU *cpu = env_archcpu(env);
>      ppc_tb_t *tb_env;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      tb_env = g_malloc0(sizeof(ppc_tb_t));
>      env->tb_env = tb_env;
>      tb_env->flags = PPC_DECR_UNDERFLOW_TRIGGERED;
> 

This one is okay.

Paolo


