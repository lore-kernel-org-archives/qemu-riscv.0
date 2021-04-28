Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbmyh-0008L9-Uh
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 12:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbmyf-0008J8-Es
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 12:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbmyc-00035d-CH
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 12:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrQj5h1DairF3Ia2cOF4g3e0ThUC2C4VniGShJFOPY8=;
 b=BUTW9TLU+9ATRVTYRlLWZca3abkWjRscMmSdNMuow3/KtLMAzROHvVy4rF4n02WPflmmgH
 oZmylEpGrOXJyNcyqFu5KE8TadV5D+NDvO8yu+qluVmcxsX8/qBYqLAyF9+/XLpf1l5vgJ
 R1AACOr9/ZwkVC1+IpqMgkTl7bZ7fY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-ZdCHUeXiPSmxbVVakMKK4A-1; Wed, 28 Apr 2021 12:23:45 -0400
X-MC-Unique: ZdCHUeXiPSmxbVVakMKK4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EF246D246;
 Wed, 28 Apr 2021 16:23:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-188.ams2.redhat.com
 [10.36.114.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A558619CAC;
 Wed, 28 Apr 2021 16:23:41 +0000 (UTC)
Subject: Re: [PATCH 1/7] stubs: Restrict fw_cfg stubs to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-2-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <6c3f66ef-03f6-f883-a7fc-1e16f4fce371@redhat.com>
Date: Wed, 28 Apr 2021 18:23:40 +0200
MIME-Version: 1.0
In-Reply-To: <20210426193520.4115528-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 28 Apr 2021 16:23:53 -0000

On 04/26/21 21:35, Philippe Mathieu-Daudé wrote:
> User emulation or tools don't use / require the fw_cfg device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  stubs/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubs/meson.build b/stubs/meson.build
> index be6f6d609e5..4ff36401cf9 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -12,7 +12,6 @@
>  stub_ss.add(files('dump.c'))
>  stub_ss.add(files('error-printf.c'))
>  stub_ss.add(files('fdset.c'))
> -stub_ss.add(files('fw_cfg.c'))
>  stub_ss.add(files('gdbstub.c'))
>  stub_ss.add(files('get-vm-name.c'))
>  stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
> @@ -49,6 +48,7 @@
>    stub_ss.add(files('replay-tools.c'))
>  endif
>  if have_system
> +  stub_ss.add(files('fw_cfg.c'))
>    stub_ss.add(files('semihost.c'))
>    stub_ss.add(files('xen-hw-stub.c'))
>  else
> 

The intent is valid and the implementation looks plausible.

Acked-by: Laszlo Ersek <lersek@redhat.com>


