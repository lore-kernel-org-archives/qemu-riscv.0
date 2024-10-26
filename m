Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD0DD10BE4
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 05:16:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t4Z96-0007v3-Ie; Sat, 26 Oct 2024 01:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t4Z93-0007tO-IN
 for qemu-riscv@nongnu.org; Sat, 26 Oct 2024 01:15:25 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t4Z90-0005VL-Pg
 for qemu-riscv@nongnu.org; Sat, 26 Oct 2024 01:15:25 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20cbca51687so23525035ad.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Oct 2024 22:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1729919721; x=1730524521;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9lkjIH+RNv/hqxDhHXqLrH3VaNE6kLd/QmE8MdK8M1k=;
 b=SYTBLfsQ83f+nYIhtwjj3HOew3EeXhAYk45yBGQnKS63AeC8RLSGgRcr/q/QhVY6R9
 kcPOZ5p0WoXyzII3t+eegDAybQWA7/I2mFxBwMZiqMNkba6P5jpWIKgsatS5I/VUTtLm
 RjYd628QTpvgK/8X5kG+laVIKhmXtplggQeo6VuWMu4x3a71XTb7x1uxhqQAIA2MRKUN
 7brftHT+GaapwakoISMp09wt2XVUyRmMcMrTZV0jaROtK9N+wCAMpkI0QZC8xvCyrMp0
 9Jw6HOIsc+NEosUTipnHl0+h3IWaokLFH4FzodhwEVp3mEGduRBbP8ljv5yoHWCSPi6h
 7J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729919721; x=1730524521;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9lkjIH+RNv/hqxDhHXqLrH3VaNE6kLd/QmE8MdK8M1k=;
 b=StQbSNmgfDeTuPW7bQap7Ka2QsV03u/uzYXipC3Gdas5rxPLYY/FB0NzXR3uVW4qGj
 jZikjCaZSuB7lUS1V7eYMfo4XoDTPCY9Jmu+zISLbWuV7gFlOjYlJ0PAalsvfeKy33zX
 GFPin8tx9yT5Dedh115kZoYMtKTE9ej0WlcqIIf/D12gdhQ/oCfAjsMrcZ+fC6EzJtti
 0VwEB8ukfE0pJsLhUUHANrVdqlJBBI9H4A4bFGFWVsYvJI9hF4zHWNab8BgeSTL1f/O9
 OGtn+YzeHS/juigBd8OosoVmvvmbF7FZ+VJOcR5k/VRZ5SD4tsZGSw5UUbk2418c+qOB
 qrfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFnb1+tpmOxKx9cpdemirpRHmyBL59+RP8umvPN73U6izojXFVSpKC6eeP/H5iqSQG4TxhmyJfe3qw@nongnu.org
X-Gm-Message-State: AOJu0YyPYxSlb0ysBqyW2Rt/KWj4ylKQFnI0JJjtBpkHLGmcrjDQ2i0o
 DG6/+a+6RsN6d1/oYhKR/UfG26sl1I3Y93QXVFHF8rXOg4INfWRCMcPyfkeFfB4=
X-Google-Smtp-Source: AGHT+IFnJeeNZDsTvVExrZ65DcAoAoNymCVIzhTM+AZRUKwPnmFor60FHkUZ2KW8QPNyJ994mBEgSQ==
X-Received: by 2002:a17:903:2343:b0:20c:716c:5c2 with SMTP id
 d9443c01a7336-210c68995d7mr21738155ad.13.1729919720980; 
 Fri, 25 Oct 2024 22:15:20 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc082ed8sm17814255ad.298.2024.10.25.22.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 22:15:20 -0700 (PDT)
Message-ID: <b51b176d-0130-4794-a1de-50fa1052eedc@daynix.com>
Date: Sat, 26 Oct 2024 14:15:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] hw/display/apple-gfx: Adds configurable mode list
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org
References: <20241024102813.9855-1-phil@philjordan.eu>
 <20241024102813.9855-5-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241024102813.9855-5-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2024/10/24 19:28, Phil Dennis-Jordan wrote:
> This change adds a property 'display_modes' on the graphics device
> which permits specifying a list of display modes. (screen resolution
> and refresh rate)
> 
> The property is an array of a custom type to make the syntax slightly
> less awkward to use, for example:
> 
> -device '{"driver":"apple-gfx-pci", "display-modes":["1920x1080@60", "3840x2160@60"]}'
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> ---
> 
> v4:
> 
>   * Switched to the native array property type, which recently gained
> 	 command line support.
>   * The property has also been added to the -mmio variant.
>   * Tidied up the code a little.
> 
>   hw/display/apple-gfx-mmio.m |   8 +++
>   hw/display/apple-gfx-pci.m  |   9 ++-
>   hw/display/apple-gfx.h      |  12 ++++
>   hw/display/apple-gfx.m      | 127 ++++++++++++++++++++++++++++++++----
>   hw/display/trace-events     |   2 +
>   5 files changed, 145 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/display/apple-gfx-mmio.m b/hw/display/apple-gfx-mmio.m
> index 06131bc23f1..5d427c7005e 100644
> --- a/hw/display/apple-gfx-mmio.m
> +++ b/hw/display/apple-gfx-mmio.m
> @@ -261,6 +261,12 @@ static void apple_gfx_mmio_reset(Object *obj, ResetType type)
>       [s->common.pgdev reset];
>   }
>   
> +static Property apple_gfx_mmio_properties[] = {
> +    DEFINE_PROP_ARRAY("display-modes", AppleGFXMMIOState,
> +                      common.num_display_modes, common.display_modes,
> +                      qdev_prop_display_mode, AppleGFXDisplayMode),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
>   
>   static void apple_gfx_mmio_class_init(ObjectClass *klass, void *data)
>   {
> @@ -270,6 +276,8 @@ static void apple_gfx_mmio_class_init(ObjectClass *klass, void *data)
>       rc->phases.hold = apple_gfx_mmio_reset;
>       dc->hotpluggable = false;
>       dc->realize = apple_gfx_mmio_realize;
> +
> +    device_class_set_props(dc, apple_gfx_mmio_properties);
>   }
>   
>   static TypeInfo apple_gfx_mmio_types[] = {
> diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
> index 4ee26dde422..32e81bbef8b 100644
> --- a/hw/display/apple-gfx-pci.m
> +++ b/hw/display/apple-gfx-pci.m
> @@ -115,6 +115,13 @@ static void apple_gfx_pci_reset(Object *obj, ResetType type)
>       [s->common.pgdev reset];
>   }
>   
> +static Property apple_gfx_pci_properties[] = {
> +    DEFINE_PROP_ARRAY("display-modes", AppleGFXPCIState,
> +                      common.num_display_modes, common.display_modes,
> +                      qdev_prop_display_mode, AppleGFXDisplayMode),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>   static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -132,7 +139,7 @@ static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
>       pci->class_id = PCI_CLASS_DISPLAY_OTHER;
>       pci->realize = apple_gfx_pci_realize;
>   
> -    // TODO: Property for setting mode list
> +    device_class_set_props(dc, apple_gfx_pci_properties);
>   }
>   
>   static TypeInfo apple_gfx_pci_types[] = {
> diff --git a/hw/display/apple-gfx.h b/hw/display/apple-gfx.h
> index 39931fba65a..d2c6a14229a 100644
> --- a/hw/display/apple-gfx.h
> +++ b/hw/display/apple-gfx.h
> @@ -9,6 +9,7 @@
>   #import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
>   #include "qemu/typedefs.h"
>   #include "exec/memory.h"
> +#include "hw/qdev-properties.h"
>   #include "ui/surface.h"
>   
>   @class PGDeviceDescriptor;
> @@ -20,6 +21,7 @@
>   
>   typedef QTAILQ_HEAD(, PGTask_s) PGTaskList;
>   
> +struct AppleGFXDisplayMode;
>   struct AppleGFXMapMemoryJob;
>   typedef struct AppleGFXState {
>       MemoryRegion iomem_gfx;
> @@ -31,6 +33,8 @@ typedef struct AppleGFXState {
>       id<MTLCommandQueue> mtl_queue;
>       bool cursor_show;
>       QEMUCursor *cursor;
> +    struct AppleGFXDisplayMode *display_modes;
> +    uint32_t num_display_modes;
>   
>       /* For running PVG memory-mapping requests in the AIO context */
>       QemuCond job_cond;
> @@ -47,6 +51,12 @@ typedef struct AppleGFXState {
>       id<MTLTexture> texture;
>   } AppleGFXState;
>   
> +typedef struct AppleGFXDisplayMode {
> +    uint16_t width_px;
> +    uint16_t height_px;
> +    uint16_t refresh_rate_hz;
> +} AppleGFXDisplayMode;
> +
>   void apple_gfx_common_init(Object *obj, AppleGFXState *s, const char* obj_name);
>   void apple_gfx_common_realize(AppleGFXState *s, PGDeviceDescriptor *desc,
>                                 Error **errp);
> @@ -54,5 +64,7 @@ uintptr_t apple_gfx_host_address_for_gpa_range(uint64_t guest_physical,
>                                                  uint64_t length, bool read_only);
>   void apple_gfx_await_bh_job(AppleGFXState *s, bool *job_done_flag);
>   
> +extern const PropertyInfo qdev_prop_display_mode;
> +
>   #endif
>   
> diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
> index 46be9957f69..42b601329fb 100644
> --- a/hw/display/apple-gfx.m
> +++ b/hw/display/apple-gfx.m
> @@ -28,9 +28,10 @@
>   #include "qapi/error.h"
>   #include "ui/console.h"
>   
> -static const PGDisplayCoord_t apple_gfx_modes[] = {
> -    { .x = 1440, .y = 1080 },
> -    { .x = 1280, .y = 1024 },
> +static const AppleGFXDisplayMode apple_gfx_default_modes[] = {
> +    { 1920, 1080, 60 },
> +    { 1440, 1080, 60 },
> +    { 1280, 1024, 60 },
>   };
>   
>   /* This implements a type defined in <ParavirtualizedGraphics/PGDevice.h>
> @@ -303,7 +304,6 @@ static void set_mode(AppleGFXState *s, uint32_t width, uint32_t height)
>   static void create_fb(AppleGFXState *s)
>   {
>       s->con = graphic_console_init(NULL, 0, &apple_gfx_fb_ops, s);
> -    set_mode(s, 1440, 1080);
>   
>       s->cursor_show = true;
>   }
> @@ -628,20 +628,25 @@ static void apple_gfx_register_task_mapping_handlers(AppleGFXState *s,
>       return disp_desc;
>   }
>   
> -static NSArray<PGDisplayMode*>* apple_gfx_prepare_display_mode_array(void)
> +static NSArray<PGDisplayMode*>* apple_gfx_create_display_mode_array(
> +    const AppleGFXDisplayMode display_modes[], uint32_t display_mode_count)
>   {
> -    PGDisplayMode *modes[ARRAY_SIZE(apple_gfx_modes)];
> +    PGDisplayMode **modes = alloca(sizeof(modes[0]) * display_mode_count);

Avoid alloca().

>       NSArray<PGDisplayMode*>* mode_array = nil;
> -    int i;
> +    uint32_t i;
>   
> -    for (i = 0; i < ARRAY_SIZE(apple_gfx_modes); i++) {
> +    for (i = 0; i < display_mode_count; i++) {
> +        const AppleGFXDisplayMode *mode = &display_modes[i];
> +        trace_apple_gfx_display_mode(i, mode->width_px, mode->height_px);
> +        PGDisplayCoord_t mode_size = { mode->width_px, mode->height_px };
>           modes[i] =
> -            [[PGDisplayMode alloc] initWithSizeInPixels:apple_gfx_modes[i] refreshRateInHz:60.];
> +            [[PGDisplayMode alloc] initWithSizeInPixels:mode_size
> +                                        refreshRateInHz:mode->refresh_rate_hz];
>       }
>   
> -    mode_array = [NSArray arrayWithObjects:modes count:ARRAY_SIZE(apple_gfx_modes)];
> +    mode_array = [NSArray arrayWithObjects:modes count:display_mode_count];
>   
> -    for (i = 0; i < ARRAY_SIZE(apple_gfx_modes); i++) {
> +    for (i = 0; i < display_mode_count; i++) {
>           [modes[i] release];
>           modes[i] = nil;
>       }
> @@ -679,6 +684,8 @@ void apple_gfx_common_realize(AppleGFXState *s, PGDeviceDescriptor *desc,
>                                 Error **errp)
>   {
>       PGDisplayDescriptor *disp_desc = nil;
> +    const AppleGFXDisplayMode *display_modes = apple_gfx_default_modes;
> +    int num_display_modes = ARRAY_SIZE(apple_gfx_default_modes);
>   
>       if (apple_gfx_mig_blocker == NULL) {
>           error_setg(&apple_gfx_mig_blocker,
> @@ -704,10 +711,106 @@ void apple_gfx_common_realize(AppleGFXState *s, PGDeviceDescriptor *desc,
>       s->pgdisp = [s->pgdev newDisplayWithDescriptor:disp_desc
>                                                 port:0 serialNum:1234];
>       [disp_desc release];
> -    s->pgdisp.modeList = apple_gfx_prepare_display_mode_array();
> +
> +    if (s->display_modes != NULL && s->num_display_modes > 0) {
> +        trace_apple_gfx_common_realize_modes_property(s->num_display_modes);
> +        display_modes = s->display_modes;
> +        num_display_modes = s->num_display_modes;
> +    }
> +    s->pgdisp.modeList =
> +        apple_gfx_create_display_mode_array(display_modes, num_display_modes);
>   
>       create_fb(s);
>   
>       qemu_mutex_init(&s->job_mutex);
>       qemu_cond_init(&s->job_cond);
>   }
> +
> +static void apple_gfx_get_display_mode(Object *obj, Visitor *v,
> +                                       const char *name, void *opaque,
> +                                       Error **errp)
> +{
> +    Property *prop = opaque;
> +    AppleGFXDisplayMode *mode = object_field_prop_ptr(obj, prop);
> +    /* 3 uint16s (max 5 digits) and 2 separator characters + nul. */
> +    static const size_t buffer_size = 5 * 3 + 2 + 1;
> +
> +    char buffer[buffer_size];

I prefer it to be written as: char buffer[5 * 3 + 2 + 1];
to avoid the indirection by having another variable.

 > +    char *pos = buffer;> +
> +    int rc = snprintf(buffer, buffer_size,
> +                      "%"PRIu16"x%"PRIu16"@%"PRIu16,
> +                      mode->width_px, mode->height_px,
> +                      mode->refresh_rate_hz);
> +    assert(rc < buffer_size);
> +
> +    visit_type_str(v, name, &pos, errp);
> +}
> +
> +static void apple_gfx_set_display_mode(Object *obj, Visitor *v,
> +                                       const char *name, void *opaque,
> +                                       Error **errp)
> +{
> +    Property *prop = opaque;
> +    AppleGFXDisplayMode *mode = object_field_prop_ptr(obj, prop);
> +    Error *local_err = NULL;
> +    const char *endptr;
> +    char *str;
> +    int ret;
> +    unsigned int val;
> +
> +    visit_type_str(v, name, &str, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    endptr = str;
> +
> +    ret = qemu_strtoui(endptr, &endptr, 10, &val);
> +    if (ret || val > UINT16_MAX || val == 0) {
> +        error_setg(errp, "width in '%s' must be a decimal integer number "
> +                   "of pixels in the range 1..65535", name);
> +        goto out;
> +    }
> +    mode->width_px = val;
> +    if (*endptr != 'x') {
> +        goto separator_error;
> +    }
> +
> +    ret = qemu_strtoui(endptr + 1, &endptr, 10, &val);
> +    if (ret || val > UINT16_MAX || val == 0) {
> +        error_setg(errp, "height in '%s' must be a decimal integer number "
> +                   "of pixels in the range 1..65535", name);
> +        goto out;
> +    }
> +    mode->height_px = val;
> +    if (*endptr != '@') {
> +        goto separator_error;
> +    }
> +
> +    ret = qemu_strtoui(endptr + 1, &endptr, 10, &val);

Use qemu_strtoi() or it will have a perculiar behavior with negative 
values; see the comment in util/cutils.c for details.

> +    if (ret) {
> +        error_setg(errp, "refresh rate in '%s'"
> +                   " must be a non-negative decimal integer (Hertz)", name);
> +    }
> +    mode->refresh_rate_hz = val;
> +
> +    goto out;
> +
> +separator_error:
> +    error_setg(errp, "Each display mode takes the format "
> +               "'<width>x<height>@<rate>'");
> +out:
> +    g_free(str);

Use g_autofree. docs/devel/style.rst has some explanation.

> +    return;
> +}
> +
> +const PropertyInfo qdev_prop_display_mode = {
> +    .name  = "display_mode",
> +    .description =
> +        "Display mode in pixels and Hertz, as <width>x<height>@<refresh-rate> "
> +        "Example: 3840x2160@60",
> +    .get   = apple_gfx_get_display_mode,
> +    .set   = apple_gfx_set_display_mode,
> +};
> diff --git a/hw/display/trace-events b/hw/display/trace-events
> index 214998312b9..2780239dbde 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -209,6 +209,8 @@ apple_gfx_cursor_set(uint32_t bpp, uint64_t width, uint64_t height) "bpp=%d widt
>   apple_gfx_cursor_show(uint32_t show) "show=%d"
>   apple_gfx_cursor_move(void) ""
>   apple_gfx_common_init(const char *device_name, size_t mmio_size) "device: %s; MMIO size: %zu bytes"
> +apple_gfx_common_realize_modes_property(uint32_t num_modes) "using %u modes supplied by 'display-modes' device property"
> +apple_gfx_display_mode(uint32_t mode_idx, uint16_t width_px, uint16_t height_px) "mode %2"PRIu32": %4"PRIu16"x%4"PRIu16
>   
>   # apple-gfx-mmio.m
>   apple_gfx_mmio_iosfc_read(uint64_t offset, uint64_t res) "offset=0x%"PRIx64" res=0x%"PRIx64


