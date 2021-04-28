Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbn08-0002oq-EQ
	for mharc-qemu-riscv@gnu.org; Wed, 28 Apr 2021 12:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbn06-0002jR-7g
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 12:25:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbn03-0004FL-1k
 for qemu-riscv@nongnu.org; Wed, 28 Apr 2021 12:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBdNOg2n+/RCuootEMPQndqR/oMDHOVm5dkHImnr1nc=;
 b=HmkA8dNkb0PrUsdqXIQz3elxcOnEBabvIUuZCUwMtaWW5+EX6+QZUVfdfQdBAV77u/jJuE
 Xp/8TrC+it0WLmFedIqz9pAUpIwPPonWyMC5T7KMlB/1S7NMm2+XAiY6FSWW3Hyt3ChpMJ
 01Hj+/OUFFrLnc8tO7pvGLT7hRUYDiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-yc2DmH4iMKe_qfcCmGqlyQ-1; Wed, 28 Apr 2021 12:25:16 -0400
X-MC-Unique: yc2DmH4iMKe_qfcCmGqlyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CBF210CE781;
 Wed, 28 Apr 2021 16:25:15 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-188.ams2.redhat.com
 [10.36.114.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33FA560C05;
 Wed, 28 Apr 2021 16:25:03 +0000 (UTC)
Subject: Re: [PATCH 4/7] hw/acpi/vmgenid: Make ACPI_VMGENID depends on FW_CFG
 Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-5-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d35a5ecd-3fef-a178-f06e-90f3ceea49a5@redhat.com>
Date: Wed, 28 Apr 2021 18:25:02 +0200
MIME-Version: 1.0
In-Reply-To: <20210426193520.4115528-5-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-List-Received-Date: Wed, 28 Apr 2021 16:25:22 -0000

On 04/26/21 21:35, Philippe Mathieu-Daudé wrote:
> The TYPE_VMGENID device depends on fw_cfg:
> 
>   $ git grep \ fw_cfg hw/acpi/vmgenid.c
>   hw/acpi/vmgenid.c:128:    fw_cfg_add_file(s, VMGENID_GUID_FW_CFG_FILE, guid->data,
>   hw/acpi/vmgenid.c:131:    fw_cfg_add_file_callback(s, VMGENID_ADDR_FW_CFG_FILE, NULL, NULL, NULL,
> 
> Add the proper Kconfig dependency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/acpi/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 1932f66af8d..b9dc932d2a7 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -40,5 +40,6 @@ config ACPI_VMGENID
>      bool
>      default y
>      depends on PC
> +    select FW_CFG
>  
>  config ACPI_HW_REDUCED
> 

The intent is certainly correct and the implementation looks plausible.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>


