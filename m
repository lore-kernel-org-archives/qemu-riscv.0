Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psDtz-0001U0-0l
	for mharc-qemu-riscv@gnu.org; Thu, 27 Apr 2023 22:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4752be609=Alistair.Francis@wdc.com>)
 id 1psDtx-0001Th-Oi
 for qemu-riscv@nongnu.org; Thu, 27 Apr 2023 22:32:01 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4752be609=Alistair.Francis@wdc.com>)
 id 1psDtr-00020S-5i
 for qemu-riscv@nongnu.org; Thu, 27 Apr 2023 22:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1682649115; x=1714185115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=jhx0KoMD6Aa9cVy2Nk1ORxN2OfCFOm4+aP6LuJVJFGg=;
 b=K7TKNjc4LEoremoap9cOHXK4gnRPd8AiVqy3yiWP5IRqKElxPzqStCGx
 ATuq/l5/Uukg2tH4l5OeI26uT3jOe7yh4CQEwamEddJ3W7rrx5bSe2IJh
 wHVigBMFJoHQB/gWcacrTAUdMD8NXL9BzkWA/TUENrvr/QnxH6dM62FtE
 NCtLhYvnW7bhvkTGUauQ+OF5uKISIGaNVxK66Xa40lPwJImKj7z1gmpVc
 iNgBVxK/21slYvJzEcsEEZ6MDLYDjnbEl/1TMQUaTkk0b/M0FJwwkOZiu
 m4xnamvRM13Cn1BJAvbrJXKxzszdr4pgYHG5NWDT4jrJGi7wzl2he/LDI g==;
X-IronPort-AV: E=Sophos;i="5.99,233,1677513600"; 
 d="scan'208,217";a="234437521"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2023 10:31:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gc4C35kzYmsQM++YrKqfMZELHxNoQaDRl78gh3c6SatcP0ML1w23ZCpx7PxdZ0mcNEUyQxZnrf4x1VulRb5pMuCIiNCzv44FPZezw2aOadl4ShuVruYmYFnMCrmV9j7i2JjBCzKnRDyVILbjYbkXx9DZK4TSaBYW+DB0HGdjngWVtUN807hUIXakuoOvYqVivub4cyFmTQUI2kjyLi/0b3WYQRcAJJ4c5IT6/egRERkH+2u75slMA3qUZg8jiit22F9Dl8wyQyKKEiL803c10jepGoxNMtaGeAz1Ipq47573uhUkcwc38SgLZ8PzEnulHvklT13BjRlMLwk2GH8N4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QACTlgn5QV9jmWAoct5w82R91pgRWdv4CUFljzu4KJI=;
 b=anoN9gJ/YmABMUly7VKeLWJfLOMjZs/v2ZsJWRYq6eS8PW6PDfQFSvAsOPfpmheocJmcMpW710UpTaZeEqi/xYB9PyeqSIkORPuZ2iDLm/yNzmmGjr7aYTfg0WiDHgFoXErdnwzBV5mVzv1nmSmXYslP+BUDEAAksIEDPLMt4zUCbb1/sabPD0CkrG7LKDuiMUlwUGGRKRvJ8h7WzENhH5KNtYw4j+ZHkUjwtfrzZzgp1tGYTrVvgXBHpjKxgYEnTFELgDTnKRyVoYevZ1LY5b5L7zUQG8lqBnwZb12N8qosEACfvbRB36VSM10UU9jBQ/yA2N4lJKdJHUWPTfEdRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QACTlgn5QV9jmWAoct5w82R91pgRWdv4CUFljzu4KJI=;
 b=Rq1bFWI/9oYczaYpttG2slDhJK7NNagzHFaTpt/CLaCItJOTgnpN0xCAmOWbRN+0ILMbU1W/czFvh2Nj6FROJTnb2vWmwcsjyoZoBSM26RXJTmcj6L9gZs+azXZNOxTdKiEEdKZVdy5+GkM8hv3WE0SWvKRDhXDF71yH34rJadg=
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com (2603:10b6:a03:303::20)
 by CH2PR04MB6984.namprd04.prod.outlook.com (2603:10b6:610:94::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 02:31:48 +0000
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::a6cc:777b:f631:2a7e]) by SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::a6cc:777b:f631:2a7e%7]) with mapi id 15.20.6340.021; Fri, 28 Apr 2023
 02:31:48 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>
Subject: RE: QEMU SIG Meeting
Thread-Topic: QEMU SIG Meeting
Thread-Index: Adl5d3WEYXigVKyHQyaMjKOJ2jvZOAAAdpLQ
Date: Fri, 28 Apr 2023 02:31:48 +0000
Message-ID: <SJ0PR04MB7872731EEB43478A94698A34906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
References: <SJ0PR04MB787223A0357CF1901224B0AE906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
In-Reply-To: <SJ0PR04MB787223A0357CF1901224B0AE906B9@SJ0PR04MB7872.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB7872:EE_|CH2PR04MB6984:EE_
x-ms-office365-filtering-correlation-id: f0932ed1-57b1-4595-8cb0-08db4790b781
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X0eucMJgOlojzNF56nhc6oGRrrQNOt1rnP7gkR8hXWN+szwqa7gyuKZpbC5iaaXdn7sPX2tR+iyYWKvvUECFuURssKE8RZh6jROwUPut6TlS22vZwc6MSbE53cXJ8lK5Ny21jgG2pFd2ZMoM16i+nodI1RCHCt0r1tDFudn6rza/LdLZh6ol8F7q/OzziF6rADMNKpQPzT/x9HynR+dR2JGniXRKrw1CDh/GNesTadrBfoUYwmQ/5UC3CmBWFNFT/Aqu9CxWG1pLXw3POk4v6gWx/3dicWhlxu2+iebcIKYJWcx7MDxOqW0Wu7PUrWdg8qXHpdHmEbYmmntjcZ46UzwJ7rMAgmp++QnHwRGVKhu91fdPSsCP7N44a+86QWhhmKYW/lYB12em2V3ePWUXLOrstUpmMUvW91smFsYua4N0CefqE+kfILhnjgK2/BKPneogHk+alpYSMLDPd6/RY4R2XnEX1Jn1ixtJvvlPpj4RT78py0X7rDUU8cJTvDr4LmaRyUPS4KOxDQ5y70CrheUdUe43vFIhIjHqxrpgJ8fhwqlA0m6oySRqeKxtJcmeBjOydSSDeDvVALIq/jHrOGosjnAkRjH4md76bc1CxithIUmPLwLsbNErJvhYkMOv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7872.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199021)(38070700005)(478600001)(38100700002)(7116003)(52536014)(8936002)(8676002)(5660300002)(2906002)(316002)(122000001)(66946007)(66556008)(66446008)(6916009)(66476007)(76116006)(64756008)(4326008)(55016003)(82960400001)(41300700001)(26005)(33656002)(3480700007)(6506007)(86362001)(2940100002)(186003)(9686003)(53546011)(7696005)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Oni7wth0Q3h5TNN71xMpTdzlbBFhRSz0C+6z+68vnEsHE/uKpQLHCY8Ichu?=
 =?us-ascii?Q?5rBMDxEcYSbXWqTq0lyGvb/NR/zdp61EaeSRoabxUuGM/5qX/s+HHtUk86Qq?=
 =?us-ascii?Q?cTWjXjPRa/R/nNE7UWzY14/W/ywNqJOf5LMGwU8dliABpDWfFoShyNoDAOah?=
 =?us-ascii?Q?Z89xrTK65IcPRalBFUBtyGoSLYGebT6o+f9kq5wjKsw1x7Fl+T8LcIOxR2lH?=
 =?us-ascii?Q?06Asd9f01cGveufn+SYD4CvOIrD6CUg1Tx9oeJIWo1rflAYaLhNUQgw7eZzc?=
 =?us-ascii?Q?mbTqBjK9+rsi8ENl+sJUC0vUzOG29w4r7cMBfBpy/K53F8wW96BNFVW8ADiC?=
 =?us-ascii?Q?+bFUEtoVTIrvTs7XzUay6NLFvAqY8Fi6c9AzHOQ0TnmudBP6rqqhfbASaJ7y?=
 =?us-ascii?Q?ihJJoqeR9TXKRu9dYfq8ltO7IfS3U4JthcN7qMSjl3qgX6/it9fowy3ZThmO?=
 =?us-ascii?Q?eE8jLeZDGJJ+Exk/HDnUuoQj2UGjVNXWfT8ZyGm/pr8XdAYBEqJNf6lCTO5O?=
 =?us-ascii?Q?fFMJxetY5HHP4G/YeUfaBul5/1qTYU0XVigIMVxx5lkVo/6s6GLMRrGUcgYZ?=
 =?us-ascii?Q?5GFHj5cC1VTyeyl8JNUrnCuc6Ldm4PG9hwkJr+sx034WV03cUE2A/UvbFt4X?=
 =?us-ascii?Q?teOxwoOn5JEXFCv4yEcff0DEYHxnn7PsP6QnVjwCaJ9Bv3Pkoq/hyCO6eLWe?=
 =?us-ascii?Q?wRl3dCO7QybwNc4s35KKyEXX69lQB/RiLL9xBiZB7xdloyBcA+qviNfJ957n?=
 =?us-ascii?Q?CWX4w7lXPoL8sK/mWrJD9NHNupRsQ7r1ePeQRT7LbR1f4NuyiqESlDn96y0i?=
 =?us-ascii?Q?KDHZ7CyT3e9KOGv9jTddDXfP3g3H8JDLXSMajI1ZaYiMbiBJN1oQHT37RgdE?=
 =?us-ascii?Q?ApuQrgyr5nZCPtS7DQtUC+s9MrZv2SYTguOk4w6GmNBj8mzHSkIwrmYh6kKh?=
 =?us-ascii?Q?Wa47BMpshe2cbfg0UC60FVhmIgeimSR8a7oK7lA7l4TdOvEo2dt9MMpHsQX2?=
 =?us-ascii?Q?lqLkHe1X/XDlxj3/fzz+UCNzQl9c1Rd9pYKC1OkMroYvaryrmfYhxciC+dhB?=
 =?us-ascii?Q?m3Ph8gqV1CwFrVJyzqTqc75Y96XEh95AlGoIopF6M/OMv2zFUIjTpKTkwHKV?=
 =?us-ascii?Q?DIS2rQnAl4yzijKtMisLD9zdiuYZ6YS5PTVf3pdp3Bxncyksc5Wk9uAt5xoM?=
 =?us-ascii?Q?mrKWpL+vXKolTtjFP0yp3D0dikLUpboYj9LwLchKRCNp2hKAl+Bacxqb6u66?=
 =?us-ascii?Q?wa5tWMs366d5kwfPGsqSfIhhm6FRWVlKoBeVHgBi0B3+P3d7dhQIWAUm8gvr?=
 =?us-ascii?Q?b7hmAd1H+mBvqdO/JZuN0N3bfd7dDRUT6M5bzZkgG20rVJ4g6pvjWM9sMqEX?=
 =?us-ascii?Q?psk04Llz6hHj0eZrCZJsJzpovxgneAtrFAGmWKQlM+K5CEMSiMvxDH5cUhFq?=
 =?us-ascii?Q?iZpBOo0OWKgCeH9QCb//WCTi6vwrS4FPLPOUQPQlbVYjSvodGfzkmZPGdLFL?=
 =?us-ascii?Q?zfsji0nrECTZ6LAU0wjSy3mrHl80mRSHXe20xs3DB4EKrEc7jGso9LgqqaEw?=
 =?us-ascii?Q?cQ8Xd3BdT4mxDprvC1M0IX6q/X0lSWUBeTOCyZYy?=
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR04MB7872731EEB43478A94698A34906B9SJ0PR04MB7872namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lVdn57pY8PK4yZDDfCBT3jlXKpF2HYBXTk9qk9Pgsdc1Kvl3KU0jdvDbW0/TxCTGgsRnX75bVZIZ899hhfGTAFOCtjuIRtp5F/EoHNXFSSkUDy0G8F78hYEJX33zIPnyX0bvnfagKto0mDeQlcd1frMSQT98NQNcsF1vuqpkVBh2zFRmFwKiSAzPFXRimQxx7tfm4ALUqDsLQJ+MEwUbOQeA23nM86VIrytpyLJyQvey5L2cISJWaZE3odeGH6BZI2kcR0nB+ej3nspGvn990m4tclN0OZT76vRcKpg9TSYR/ZD9nvozEMbbVlJmIAUJT0e5LnYv3qhwQ5QvSGq+FL1N8aOMxMb+NQoZFG+4i9XUyva1K0YRzSYQ9QI90jDWvV/Z03+o1/Y83jGi2tiQNdQU2q7exYC0kOMwxjBS+C6JCvstPyS83xJmkci/v4iU1trgf9+yklmbjqpSp9ua59BK6d0KmSjBUM4iuBJCs341Hn60Vx1ddydnqPxaPenPBY5xkA8LbZ8ZbWfVYch51VJCvcJPVz9Gt2MnKG8zVJW2IMiYqocsUoL2x1RX3BYzDgeJKFJwzmJZ8JMes6YbimlVRejj1mw5CTeqF5ds5MBUsAjqX1LJ33ZXhHo74pnb07exgvsBLm41wAwAVR7GEQxKoq2BLb3cDdFa6dFCXVSD9wGHwFlxLCAXIYt0/Q4ZvDv/MRWgjExZxWhupgiH7qw4uullHS+UEXmtU0D2S1OEvyJoM3rmsX9AjY2RZKsJceztATuZjb9Nlr74AHeglw/NZXvzAyqvAm2gr4o64ker+NyzngjHcJ1cJtNfqe0X
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7872.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0932ed1-57b1-4595-8cb0-08db4790b781
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 02:31:48.2636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jyN5OA/HaCbQK8hM5JDOH+rbZ2mHdHstwobq5w8E/jJ2gHUKVOtJUrAeNruIrgUD8e7lVvcpMh5wibKkxl/DBypt+wLYW+VVyi8FECrZ0f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6984
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=4752be609=Alistair.Francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 02:32:02 -0000

--_000_SJ0PR04MB7872731EEB43478A94698A34906B9SJ0PR04MB7872namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok! The calendar events are created (took a few goes) and you should be abl=
e to see them.

Also I have lost any RISC-V list messages sent over the last month, so Guer=
ney if you want to resend your email I can try and help.

Alistair

From: Alistair Francis
Sent: Friday, 28 April 2023 12:17 PM
To: qemu-riscv@nongnu.org
Cc: alistair@alistair23.me
Subject: QEMU SIG Meeting

Hello!

Sorry about the delay! We have had some technical issues over here and I ha=
ven't had access to emails. I am trying to switch over to my personal email=
 to simplify things in the future.

So a few updates from last time.

First, Zhiwei and I are switching chair and vice-chair positions. I'm no lo=
nger a RISC-V foundation member so I can't remain as chair.

Secondly let's actually schedule that meeting! From the poll the two best t=
imes are:

Tuesday 4PM AEST -> Tuesday 6AM UTC
Thursday 10AM AEST -> Thursday 12AM UTC

So let's alternate between those two. We can start with fortnightly (so peo=
ple should be able to attend a meeting a month) and go from there.

Alistair


--_000_SJ0PR04MB7872731EEB43478A94698A34906B9SJ0PR04MB7872namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.size
	{mso-style-name:size;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Ok! The calendar events are created (took a few goes=
) and you should be able to see them.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also I have lost any RISC-V list messages sent over =
the last month, so Guerney if you want to resend your email I can try and h=
elp.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Alistair<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Alistair Francis <br>
<b>Sent:</b> Friday, 28 April 2023 12:17 PM<br>
<b>To:</b> qemu-riscv@nongnu.org<br>
<b>Cc:</b> alistair@alistair23.me<br>
<b>Subject:</b> QEMU SIG Meeting<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hello!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sorry about the delay! We have had some technical is=
sues over here and I haven't had access to emails. I am trying to switch ov=
er to my personal email to simplify things in the future.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So a few updates from last time.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">First, Zhiwei and I are switching chair and vice-cha=
ir positions. I'm no longer a RISC-V foundation member so I can't remain as=
 chair.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Secondly let's actually schedule that meeting! From =
the poll the two best times are:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span class=3D"size">Tuesday 4PM AEST -&gt; Tuesday =
6AM UTC</span><br>
<span class=3D"size">Thursday 10AM AEST -&gt; Thursday 12AM UTC</span><o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span class=3D"size">So let's alternate between thos=
e two. We can start with fortnightly (so people should be able to attend a =
meeting a month) and go from there.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Alistair<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR04MB7872731EEB43478A94698A34906B9SJ0PR04MB7872namp_--

